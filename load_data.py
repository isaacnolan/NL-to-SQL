import os, random, re, string
from collections import Counter
from tqdm import tqdm
import pickle

from torch.utils.data import Dataset, DataLoader
from torch.nn.utils.rnn import pad_sequence

import nltk
nltk.download('punkt')
from transformers import T5TokenizerFast
import torch

PAD_IDX = 0

class T5Dataset(Dataset):

    def __init__(self, data_folder, split):
        '''
        Skeleton for the class for performing data processing for the T5 model.

        Some tips for implementation:
            * You should be using the 'google-t5/t5-small' tokenizer checkpoint to tokenize both
              the encoder and decoder output. 
            * You want to provide the decoder some beginning of sentence token. Any extra-id on the
              T5Tokenizer should serve that purpose.
            * Class behavior should be different on the test set.
        '''
        self.data_folder = data_folder
        self.split = split  # One of 'train', 'dev', 'test'
        self.tokenizer = T5TokenizerFast.from_pretrained('google-t5/t5-small')
        self.process_data(data_folder, split, self.tokenizer)


    def process_data(self, data_folder, split, tokenizer):
        """
        Read the natural language and SQL files for the given split, apply simple
        alignment replacements (from `data/alignment.txt`) and tokenize inputs and
        targets using the provided `tokenizer`.

        After this runs the dataset will have:
            - self.inputs: list of lists (encoder input ids)
            - self.targets: list of lists (decoder target ids)
            - self.decoder_start_token_id: integer token id used as the first
              decoder input (falls back to pad token id if not available)
        """
        if split not in {"train", "dev", "test"}:
            raise ValueError("split must be one of 'train', 'dev', or 'test'")

        # Load alignment replacements if present
        alignment_path = os.path.join(data_folder, 'alignment.txt')
        align_map = []
        if os.path.exists(alignment_path):
            with open(alignment_path, 'r') as f:
                for line in f:
                    line = line.strip()
                    if not line:
                        continue
                    if '\t' in line:
                        src, tgt = line.split('\t', 1)
                        align_map.append((src.strip().lower(), tgt.strip().lower()))

        # Load NL lines
        nl_path = os.path.join(data_folder, f"{split}.nl")
        nl_lines = []
        if os.path.exists(nl_path):
            with open(nl_path, 'r') as f:
                nl_lines = [l.strip() for l in f.readlines()]

        # For train/dev we also load SQL targets; for test there are no targets
        sql_lines = []
        if split != 'test':
            sql_path = os.path.join(data_folder, f"{split}.sql")
            if os.path.exists(sql_path):
                with open(sql_path, 'r') as f:
                    sql_lines = [l.strip() for l in f.readlines()]

        # Sanity: if both present they should match in length; otherwise proceed with min len
        n_examples = len(nl_lines)
        if split != 'test':
            n_examples = min(len(nl_lines), len(sql_lines))

        # Prepare decoder start token id (prefer <extra_id_0> if available)
        try:
            dec_start = tokenizer.convert_tokens_to_ids('<extra_id_0>')
            if dec_start is None:
                dec_start = tokenizer.pad_token_id
        except Exception:
            dec_start = tokenizer.pad_token_id
        self.decoder_start_token_id = dec_start

        inputs = []
        targets = []
        for i in range(n_examples):
            nl = nl_lines[i].strip()
            # apply alignment replacements (longer first)
            for src, tgt in sorted(align_map, key=lambda x: -len(x[0])):
                # simple case-insensitive replacement
                nl = re.sub(r"\b" + re.escape(src) + r"\b", tgt, nl, flags=re.IGNORECASE)

            # Tokenize encoder input (keep special tokens)
            enc = tokenizer.encode(nl, add_special_tokens=True)

            if split == 'test':
                tgt_ids = []
            else:
                sql = sql_lines[i].strip()
                tgt_ids = tokenizer.encode(sql, add_special_tokens=True)

            inputs.append(enc)
            targets.append(tgt_ids)

        self.inputs = inputs
        self.targets = targets
    
    def __len__(self):
        return len(self.inputs)

    def __getitem__(self, idx):
        # include decoder start token id for collate functions
        return self.inputs[idx], self.targets[idx], self.decoder_start_token_id

def normal_collate_fn(batch):
    '''
    Collation function to perform dynamic padding for training and evaluation with the
    development or validation set.

    Inputs:
        * batch (List[Any]): batch is a list of length batch_size, where each index contains what
                             the dataset __getitem__ function returns.

    Returns: To be compatible with the provided training loop, you should be returning
        * encoder_ids: The input ids of shape BxT to be fed into the T5 encoder.
        * encoder_mask: Mask of shape BxT associated with padding tokens in the encoder input
        * decoder_inputs: Decoder input ids of shape BxT' to be fed into T5 decoder.
        * decoder_targets: The target tokens with which to train the decoder (the tokens following each decoder input)
        * initial_decoder_inputs: The very first input token to be decoder (only to be used in evaluation)
    '''
    # batch is a list of tuples: (enc_ids, tgt_ids, decoder_start_id)
    enc_seqs = [item[0] for item in batch]
    tgt_seqs = [item[1] for item in batch]
    # decoder start id is same for each item; fall back to PAD_IDX
    dec_start = batch[0][2] if len(batch[0]) > 2 else PAD_IDX

    # pad encoder sequences
    max_enc = max(len(s) for s in enc_seqs)
    enc_padded = [s + [PAD_IDX] * (max_enc - len(s)) for s in enc_seqs]
    encoder_ids = torch.tensor(enc_padded, dtype=torch.long)
    encoder_mask = (encoder_ids != PAD_IDX).long()

    # pad target sequences
    if any(len(s) == 0 for s in tgt_seqs):
        # if any empty (shouldn't happen for train/dev), make them single PAD
        tgt_seqs = [[PAD_IDX] if len(s) == 0 else s for s in tgt_seqs]

    max_tgt = max(len(s) for s in tgt_seqs)
    tgt_padded = [s + [PAD_IDX] * (max_tgt - len(s)) for s in tgt_seqs]
    decoder_targets = torch.tensor(tgt_padded, dtype=torch.long)

    # decoder inputs: prepend dec_start and remove last token of target
    decoder_inputs = []
    for s in tgt_seqs:
        inp = [dec_start] + s[:-1]
        inp = inp + [PAD_IDX] * (max_tgt - len(inp))
        decoder_inputs.append(inp)
    decoder_inputs = torch.tensor(decoder_inputs, dtype=torch.long)

    # initial decoder inputs (one token per example)
    initial_decoder_inputs = torch.tensor([dec_start for _ in batch], dtype=torch.long)

    return encoder_ids, encoder_mask, decoder_inputs, decoder_targets, initial_decoder_inputs

def test_collate_fn(batch):
    '''
    Collation function to perform dynamic padding for inference on the test set.

    Inputs:
        * batch (List[Any]): batch is a list of length batch_size, where each index contains what
                             the dataset __getitem__ function returns.

    Recommended returns: 
        * encoder_ids: The input ids of shape BxT to be fed into the T5 encoder.
        * encoder_mask: Mask of shape BxT associated with padding tokens in the encoder input
        * initial_decoder_inputs: The very first input token to be decoder (only to be used in evaluation)
    '''
    # batch is a list of tuples: (enc_ids, tgt_ids_or_empty, decoder_start_id)
    enc_seqs = [item[0] for item in batch]
    dec_start = batch[0][2] if len(batch[0]) > 2 else PAD_IDX

    max_enc = max(len(s) for s in enc_seqs)
    enc_padded = [s + [PAD_IDX] * (max_enc - len(s)) for s in enc_seqs]
    encoder_ids = torch.tensor(enc_padded, dtype=torch.long)
    encoder_mask = (encoder_ids != PAD_IDX).long()

    initial_decoder_inputs = torch.tensor([dec_start for _ in batch], dtype=torch.long)

    return encoder_ids, encoder_mask, initial_decoder_inputs

def get_dataloader(batch_size, split):
    data_folder = 'data'
    dset = T5Dataset(data_folder, split)
    shuffle = split == "train"
    collate_fn = normal_collate_fn if split != "test" else test_collate_fn

    dataloader = DataLoader(dset, batch_size=batch_size, shuffle=shuffle, collate_fn=collate_fn)
    return dataloader

def load_t5_data(batch_size, test_batch_size):
    train_loader = get_dataloader(batch_size, "train")
    dev_loader = get_dataloader(test_batch_size, "dev")
    test_loader = get_dataloader(test_batch_size, "test")
    
    return train_loader, dev_loader, test_loader


def load_lines(path):
    with open(path, 'r') as f:
        lines = f.readlines()
        lines = [line.strip() for line in lines]
    return lines

def load_prompting_data(data_folder):
    """
    Load raw prompting data: return lists of NL/SQL strings for train/dev/test.

    Returns:
        train_x, train_y, dev_x, dev_y, test_x
    where train_x/train_y and dev_x/dev_y are lists of strings and test_x is a list
    of test NL inputs (no targets).
    """
    train_nl = []
    train_sql = []
    dev_nl = []
    dev_sql = []
    test_nl = []

    train_nl_path = os.path.join(data_folder, 'train.nl')
    train_sql_path = os.path.join(data_folder, 'train.sql')
    dev_nl_path = os.path.join(data_folder, 'dev.nl')
    dev_sql_path = os.path.join(data_folder, 'dev.sql')
    test_nl_path = os.path.join(data_folder, 'test.nl')

    if os.path.exists(train_nl_path):
        train_nl = load_lines(train_nl_path)
    if os.path.exists(train_sql_path):
        train_sql = load_lines(train_sql_path)
    if os.path.exists(dev_nl_path):
        dev_nl = load_lines(dev_nl_path)
    if os.path.exists(dev_sql_path):
        dev_sql = load_lines(dev_sql_path)
    if os.path.exists(test_nl_path):
        test_nl = load_lines(test_nl_path)

    return train_nl, train_sql, dev_nl, dev_sql, test_nl