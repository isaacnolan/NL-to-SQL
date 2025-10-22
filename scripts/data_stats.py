#!/usr/bin/env python3
"""
Compute dataset statistics before and after preprocessing using the T5 tokenizer.

Outputs a small text table suitable for pasting into the report.
"""
import os
from collections import Counter
import numpy as np
from pathlib import Path
import argparse
import pickle
import sys

# ensure repo root is on path
REPO_ROOT = Path(__file__).resolve().parents[1]
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

from transformers import T5TokenizerFast
from load_data import load_prompting_data, T5Dataset


def tokenize_lines(tokenizer, lines):
    toks = [tokenizer.encode(l, add_special_tokens=True) for l in lines]
    return toks


def vocab_size_from_token_lists(token_lists):
    vocab = set()
    for lst in token_lists:
        vocab.update(lst)
    return len(vocab)


def read_lines(path):
    if not os.path.exists(path):
        return []
    with open(path, 'r') as f:
        return [l.strip() for l in f.readlines()]


def compute_stats_for_split(split, tokenizer):
    # use repo-root data directory so the script works when run from scripts/
    data_dir = str(REPO_ROOT / 'data')
    nl_path = os.path.join(data_dir, f"{split}.nl")
    sql_path = os.path.join(data_dir, f"{split}.sql")

    nl_lines = read_lines(nl_path)
    sql_lines = read_lines(sql_path)

    # Before preprocessing: naive tokenization of raw lines
    nl_tok_before = tokenize_lines(tokenizer, nl_lines)
    sql_tok_before = tokenize_lines(tokenizer, sql_lines)

    # After preprocessing: use T5Dataset which applies alignment and tokenizer
    # Initialize dataset with absolute data_dir path
    dset = T5Dataset(data_dir, split)
    # dataset stores encoder inputs and targets as lists of ids
    nl_tok_after = dset.inputs
    sql_tok_after = dset.targets

    stats = {}
    stats['num_examples'] = len(nl_lines)
    stats['mean_nl_len_before'] = np.mean([len(x) for x in nl_tok_before]) if nl_tok_before else 0
    stats['mean_sql_len_before'] = np.mean([len(x) for x in sql_tok_before]) if sql_tok_before else 0
    stats['vocab_nl_before'] = vocab_size_from_token_lists(nl_tok_before)
    stats['vocab_sql_before'] = vocab_size_from_token_lists(sql_tok_before)

    stats['mean_nl_len_after'] = np.mean([len(x) for x in nl_tok_after]) if nl_tok_after else 0
    stats['mean_sql_len_after'] = np.mean([len(x) for x in sql_tok_after]) if sql_tok_after else 0
    stats['vocab_nl_after'] = vocab_size_from_token_lists(nl_tok_after)
    stats['vocab_sql_after'] = vocab_size_from_token_lists(sql_tok_after)

    return stats


def nice_print_table(stats_train, stats_dev):
    print("Table 1: Data statistics before any pre-processing (tokenized with T5 tokenizer)")
    print("Statistics Name\tTrain\tDev")
    print(f"Number of examples\t{stats_train['num_examples']}\t{stats_dev['num_examples']}")
    print(f"Mean sentence length (NL)\t{stats_train['mean_nl_len_before']:.2f}\t{stats_dev['mean_nl_len_before']:.2f}")
    print(f"Mean SQL query length\t{stats_train['mean_sql_len_before']:.2f}\t{stats_dev['mean_sql_len_before']:.2f}")
    print(f"Vocabulary size (natural language)\t{stats_train['vocab_nl_before']}\t{stats_dev['vocab_nl_before']}")
    print(f"Vocabulary size (SQL)\t{stats_train['vocab_sql_before']}\t{stats_dev['vocab_sql_before']}")

    print('\nTable 2: Data statistics after preprocessing (via T5Dataset.process_data)')
    print("Statistics Name\tTrain\tDev")
    print(f"Mean sentence length (NL)\t{stats_train['mean_nl_len_after']:.2f}\t{stats_dev['mean_nl_len_after']:.2f}")
    print(f"Mean SQL query length\t{stats_train['mean_sql_len_after']:.2f}\t{stats_dev['mean_sql_len_after']:.2f}")
    print(f"Vocabulary size (natural language)\t{stats_train['vocab_nl_after']}\t{stats_dev['vocab_nl_after']}")
    print(f"Vocabulary size (SQL)\t{stats_train['vocab_sql_after']}\t{stats_dev['vocab_sql_after']}")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--tokenizer', type=str, default='google-t5/t5-small')
    args = parser.parse_args()

    tokenizer = T5TokenizerFast.from_pretrained(args.tokenizer)
    stats_train = compute_stats_for_split('train', tokenizer)
    stats_dev = compute_stats_for_split('dev', tokenizer)

    nice_print_table(stats_train, stats_dev)

if __name__ == '__main__':
    main()
