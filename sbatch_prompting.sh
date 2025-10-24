#!/bin/bash
#SBATCH --job-name=Prompt_Gemma
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=28
#SBATCH --gpus-per-node=1
#SBATCH --gpu_cmode=shared
#SBATCH --time=01:00:00
#SBATCH --account=PAS3150
#SBATCH --partition=debug-nextgen   # fastest queue right now
#SBATCH --cpus-per-task=4
#SBATCH --mem=64GB
#SBATCH --mail-type=ALL
#SBATCH --output=logs/%x_%j.out
#SBATCH --error=logs/%x_%j.err
mkdir -p logs
source .venv/bin/activate
source .env
hugglingface-cli login --token $HF_TOKEN
bash run_prompting.sh
