import os, argparse, random
from tqdm import tqdm

import torch
from transformers import GemmaTokenizerFast, GemmaForCausalLM
from transformers import GemmaTokenizer, AutoModelForCausalLM
from transformers import BitsAndBytesConfig

from utils import set_random_seeds, compute_metrics, save_queries_and_records, compute_records
from prompting_utils import read_schema, extract_sql_query, save_logs
from load_data import load_prompting_data

DEVICE = torch.device('cuda') if torch.cuda.is_available() else torch.device('cpu') # you can add mps

# Maximum tokens to generate for each prompt (tunable)
MAX_NEW_TOKENS = 256

# In-memory store for support examples used to build k-shot prompts
PROMPT_EXAMPLES = None


def get_args():
    '''
    Arguments for prompting. You may choose to change or extend these as you see fit.
    '''
    parser = argparse.ArgumentParser(
        description='Text-to-SQL experiments with prompting.')

    parser.add_argument('-s', '--shot', type=int, default=0,
                        help='Number of examples for k-shot learning (0 for zero-shot)')
    parser.add_argument('-p', '--ptype', type=int, default=0,
                        help='Prompt type')
    parser.add_argument('-m', '--model', type=str, default='gemma',
                        help='Model to use for prompting: gemma (gemma-1.1-2b-it) or codegemma (codegemma-7b-it)')
    parser.add_argument('-q', '--quantization', action='store_true',
                        help='Use a quantized version of the model (e.g. 4bits)')

    parser.add_argument('--seed', type=int, default=42,
                        help='Random seed to help reproducibility')
    parser.add_argument('--experiment_name', type=str, default='experiment',
                        help="How should we name this experiment?")
    args = parser.parse_args()
    return args


def create_prompt(sentence, k):
    '''
    Function for creating a prompt for zero or few-shot prompting.

    Add/modify the arguments as needed.

    Inputs:
        * sentence (str): A text string
        * k (int): Number of examples in k-shot prompting
    '''
    global PROMPT_EXAMPLES

    # Basic instruction for the model
    instruction = (
        "Translate the following natural language question into an SQL query that can be run\n"
        "against the flights database. Respond with only the SQL query (no extra text).\n\n"
    )
    if k > 0:
        instruction += f'Provided {k} example(s) to help you.\n'
        # "against the flights database. Respond with only the SQL query (no extra text).\n\n --- IGNORE ---
        # " --- IGNORE ---
    

    # If no support examples are available, fall back to a simple zero-shot instruction
    support_text = ""
    if k > 0 and PROMPT_EXAMPLES:
        # sample the first k examples (you can change to random.sample for variability)
        k_clamped = min(k, len(PROMPT_EXAMPLES))
        for i in range(k_clamped):
            nl, sql = PROMPT_EXAMPLES[i]
            support_text += f"Question: {nl}\nSQL: {sql}\n\n"

    # Final query to complete
    query_text = f"Question: {sentence}\nSQL:"

    prompt = SCHEMA_HINT + "\n" + instruction + support_text + query_text
    return prompt


def exp_kshot(tokenizer, model, inputs, k):
    '''
    k-shot prompting experiments using the provided model and tokenizer. 
    This function generates SQL queries from text prompts and evaluates their accuracy.

    Add/modify the arguments and code as needed.

    Inputs:
        * tokenizer
        * model
        * inputs (List[str]): A list of text strings
        * k (int): Number of examples in k-shot prompting
    '''
    raw_outputs = []
    extracted_queries = []

    # Debug: show which support examples are active for this run.
    if k > 0:
        if not PROMPT_EXAMPLES:
            print("[inspect] PROMPT_EXAMPLES is empty even though k > 0. Falling back to zero-shot prompting.")
        else:
            preview_count = min(k, len(PROMPT_EXAMPLES), 3)
            print(f"[inspect] Using {k}-shot prompting. Showing {preview_count} support example(s):")
            for idx in range(preview_count):
                nl, sql = PROMPT_EXAMPLES[idx]
                print(f"[inspect] Support {idx} NL: {nl}")
                print(f"[inspect] Support {idx} SQL: {sql}\n")

    prompt_preview_printed = False

    # inputs is a list of natural language strings
    for sentence in tqdm(inputs):
        prompt = create_prompt(sentence, k)

        if not prompt_preview_printed:
            print("[inspect] Prompt sent to model (first occurrence, truncated to 800 chars):")
            print(prompt[:800])
            prompt_preview_printed = True
            
        # Tokenize and move tensors to device
        inputs_enc = tokenizer(prompt, return_tensors="pt", truncation=True)
        input_ids = inputs_enc["input_ids"].to(DEVICE)
        attention_mask = inputs_enc.get("attention_mask")
        if attention_mask is not None:
            attention_mask = attention_mask.to(DEVICE)

        # Generate (greedy or beam can be set via model.generate kwargs)
        gen_ids = model.generate(
            input_ids=input_ids,
            attention_mask=attention_mask,
            max_new_tokens=MAX_NEW_TOKENS,
            temperature=0.0,
            do_sample=False,
            eos_token_id=tokenizer.eos_token_id,
            pad_token_id=tokenizer.pad_token_id or tokenizer.eos_token_id,
        )

        # Decode
        response = tokenizer.decode(gen_ids[0], skip_special_tokens=True)
        raw_outputs.append(response)

        # Extract the SQL query from the raw output
        extracted_query = extract_sql_query(response)
        extracted_queries.append(extracted_query)

    return raw_outputs, extracted_queries


def eval_outputs(generated_queries, eval_y, gt_path, model_path, gt_query_records=None, model_query_records=None):
    '''
    Evaluate a list of generated SQL queries by saving them, computing records, and
    calling the metric utilities.

    Inputs:
        * generated_queries (List[str]): Model-generated SQL strings (already post-processed)
        * eval_y: ground-truth SQLs (unused here, but kept for compatibility)
        * gt_path: path to ground-truth .sql file
        * model_path: path where to save generated SQLs
        * gt_query_records: optional path to precomputed ground-truth records (pickle)
        * model_query_records: optional path where to save model records (pickle)
    '''
    # Save generated queries and compute/save records
    save_queries_and_records(generated_queries, model_path, model_query_records)

    # Compute metrics
    sql_em, record_em, record_f1, model_error_msgs = compute_metrics(gt_path, model_path, gt_query_records, model_query_records)

    error_count = sum(1 for m in model_error_msgs if m)
    error_rate = error_count / max(1, len(model_error_msgs))

    return sql_em, record_em, record_f1, model_error_msgs, error_rate


def initialize_model_and_tokenizer(model_name, to_quantize=False):
    '''
    Args:
        * model_name (str): Model name ("gemma" or "codegemma").
        * to_quantize (bool): Use a quantized version of the model (e.g. 4bits)
    
    To access to the model on HuggingFace, you need to log in and review the 
    conditions and access the model's content.
    '''
    if model_name == "gemma":
        model_id = "google/gemma-1.1-2b-it"
        tokenizer = GemmaTokenizerFast.from_pretrained(model_id)
        # Native weights exported in bfloat16 precision, but you can use a different precision if needed
        model = GemmaForCausalLM.from_pretrained(
            model_id,
            torch_dtype=torch.bfloat16, 
        ).to(DEVICE)
    elif model_name == "codegemma":
        model_id = "google/codegemma-7b-it"
        tokenizer = GemmaTokenizer.from_pretrained(model_id)
        if to_quantize:
            nf4_config = BitsAndBytesConfig(
                load_in_4bit=True,
                bnb_4bit_quant_type="nf4", # 4-bit quantization
            )
            model = AutoModelForCausalLM.from_pretrained(model_id,
                                                        torch_dtype=torch.bfloat16,
                                                        config=nf4_config).to(DEVICE)
        else:
            model = AutoModelForCausalLM.from_pretrained(model_id,
                                                        torch_dtype=torch.bfloat16).to(DEVICE)
    return tokenizer, model


SCHEMA_HINT = """
Relevant tables:
  flight(flight_id, from_airport, to_airport, departure_time, arrival_time, airline_code, flight_number, stops, connections)
  airport(airport_code, airport_name, city_code, state_code)
  city(city_code, city_name, state_code)
  flight_stop(flight_id, stop_airport, stop_number)
Always join flight→airport→city when the user mentions city names. Times are HHMM integers, not timestamps.
"""


def main():
    '''
    Note: this code serves as a basic template for the prompting task. You can but 
    are not required to use this pipeline.
    You can design your own pipeline, and you can also modify the code below.
    '''
    args = get_args()
    shot = args.shot
    ptype = args.ptype
    model_name = args.model
    to_quantize = args.quantization
    experiment_name = args.experiment_name

    set_random_seeds(args.seed)

    data_folder = 'data'
    train_x, train_y, dev_x, dev_y, test_x = load_prompting_data(data_folder)

    # Model and tokenizer
    tokenizer, model = initialize_model_and_tokenizer(model_name, to_quantize)

    global PROMPT_EXAMPLES
    PROMPT_EXAMPLES = list(zip(train_x, train_y))
    random.shuffle(PROMPT_EXAMPLES)

    for eval_split in ["dev", "test"]:
        eval_x, eval_y = (dev_x, dev_y) if eval_split == "dev" else (test_x, None)

        raw_outputs, extracted_queries = exp_kshot(tokenizer, model, eval_x, shot)

        # You can add any post-processing if needed
        # You can compute the records with `compute_records``

        # Prepare paths and ensure directories exist
        gt_query_records = f"records/dev_gt_records.pkl"
        gt_sql_path = os.path.join(f'data/{eval_split}.sql')
        gt_record_path = os.path.join(f'records/ground_truth_dev.pkl')
        os.makedirs('results', exist_ok=True)
        os.makedirs('records', exist_ok=True)
        model_sql_path = os.path.join(f'results/gemma_{experiment_name}_{eval_split}.sql')
        model_record_path = os.path.join(f'records/gemma_{experiment_name}_{eval_split}.pkl')

        # Evaluate using the extracted/generated SQL queries (not the input text)
        sql_em, record_em, record_f1, model_error_msgs, error_rate = eval_outputs(
            extracted_queries, eval_y,
            gt_path=gt_sql_path,
            model_path=model_sql_path,
            gt_query_records=gt_query_records,
            model_query_records=model_record_path
        )

        # Print a few sample raw model outputs and extracted queries for debugging
        print(f"Sample raw model outputs (first 5):")
        for i, out in enumerate(raw_outputs[:5]):
            # keep output short to avoid huge logs
            snippet = out.replace('\n', ' ')[:400]
            print(f"[{i}] {snippet}")

        print(f"Sample extracted queries (first 5):")
        for i, q in enumerate(extracted_queries[:5]):
            print(f"[{i}] {q}")
        print(f"{eval_split} set results: ")
        print(f"Record F1: {record_f1}, Record EM: {record_em}, SQL EM: {sql_em}")
        print(f"{eval_split} set results: {error_rate*100:.2f}% of the generated outputs led to SQL errors")

    # Save results
    # You can for instance use the `save_queries_and_records` function

    # Save logs, if needed. Ensure logs directory exists and use a sensible default
    os.makedirs('logs', exist_ok=True)
    log_path = os.path.join('logs', f"{experiment_name}_{eval_split}.log")
    save_logs(log_path, sql_em, record_em, record_f1, model_error_msgs)


if __name__ == "__main__":
    main()