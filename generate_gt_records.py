#!/usr/bin/env python3
"""
Generate ground-truth query records for train/dev/test splits.

Usage examples:
  # generate dev records
  python scripts/generate_gt_records.py --split dev

  # generate for all splits
  python scripts/generate_gt_records.py --split all

Outputs are written to `records/{split}_gt_records.pkl`.
"""
import argparse
import os
import pickle
import sys
from pathlib import Path

# Ensure the repository root is on sys.path so `import utils` works
# whether the script is invoked from the repo root or from the scripts/ folder.
REPO_ROOT = Path(__file__).resolve().parents[1]
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

from utils import read_queries, compute_records


def generate_for_split(split, data_dir='data', out_dir='records'):
    sql_path = os.path.join(data_dir, f"{split}.sql")
    if not os.path.exists(sql_path):
        print(f"No SQL file found for split '{split}' at {sql_path}, skipping.")
        return

    qs = read_queries(sql_path)
    print(f"Computing records for {len(qs)} queries from {sql_path}...")
    records, error_msgs = compute_records(qs)

    os.makedirs(out_dir, exist_ok=True)
    out_path = os.path.join(out_dir, f"{split}_gt_records.pkl")
    with open(out_path, 'wb') as f:
        pickle.dump((records, error_msgs), f)

    print(f"Wrote records to {out_path}")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--split', type=str, default='dev',
                        choices=['train', 'dev', 'test', 'all'],
                        help='Which split to generate records for')
    parser.add_argument('--data_dir', type=str, default='data', help='Data directory')
    parser.add_argument('--out_dir', type=str, default='records', help='Output directory for pickles')
    args = parser.parse_args()

    splits = ['train', 'dev', 'test'] if args.split == 'all' else [args.split]
    for s in splits:
        generate_for_split(s, data_dir=args.data_dir, out_dir=args.out_dir)


if __name__ == '__main__':
    main()
