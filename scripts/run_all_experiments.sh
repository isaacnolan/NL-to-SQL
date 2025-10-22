#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Driver script to run the main experiments for the assignment.
# Features:
# - Configurable T5 fine-tune / from-scratch sweeps
# - Prompting ablation and k-sweeps
# - Data prep steps (generate GT records, compute data stats)
# - Dry-run mode to preview commands without executing
# - Selective execution via --only (t5,prompt,prompt-ablation,stats,all)

# Usage examples:
#   bash scripts/run_all_experiments.sh --dry-run
#   bash scripts/run_all_experiments.sh --only t5 --dry-run
#   bash scripts/run_all_experiments.sh --only prompt --shot 3

DRY_RUN=0
ONLY="all"
# default small quick lists; expand when you have time/resources
T5_FINETUNE_OPTIONS=(true false)
T5_LR_LIST=(3e-5 1e-4)
T5_BATCH_SIZES=(8 16)
T5_EPOCHS=(3 10)
T5_SEEDS=(42)

# Prompting ablation variants (must match prompting.py variant names)
PROMPT_VARIANTS=("" "no_support" "no_instruction" "reverse_examples" "single_example")
PROMPT_KS=(0 1 2 3 5)
PROMPT_MODEL="gemma"
PROMPT_QUANTIZE=0
PROMPT_EXPERIMENT_PREFIX="icl"

# Paths
SCRIPTS_DIR="$(dirname "$0")"
REPO_ROOT="$(cd "$SCRIPTS_DIR/.." && pwd)"
RESULTS_DIR="$REPO_ROOT/results"
RECORDS_DIR="$REPO_ROOT/records"
LOGS_DIR="$REPO_ROOT/logs"

mkdir -p "$RESULTS_DIR" "$RECORDS_DIR" "$LOGS_DIR"

# parse args
while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run|-n)
      DRY_RUN=1; shift;;
    --only)
      ONLY="$2"; shift 2;;
    --shot)
      PROMPT_KS=($2); shift 2;;
    --model)
      PROMPT_MODEL="$2"; shift 2;;
    --quantize)
      PROMPT_QUANTIZE=1; shift;;
    --help|-h)
      sed -n '1,160p' "$0"; exit 0;;
    *)
      echo "Unknown arg: $1"; exit 1;;
  esac
done

run_cmd() {
  if [ "$DRY_RUN" -eq 1 ]; then
    echo "+ $*"
  else
    echo "Running: $*"
    eval "$*"
  fi
}

# 1) Data prep: generate ground-truth records and data stats
run_stats_and_prep() {
  echo "\n=== Data prep: generate GT records and compute data stats ==="
  run_cmd "python $REPO_ROOT/scripts/generate_gt_records.py --split train" || true
  run_cmd "python $REPO_ROOT/scripts/generate_gt_records.py --split dev" || true
  run_cmd "python $REPO_ROOT/scripts/data_stats.py" || true
}

# 2) T5 experiments sweep
run_t5_sweeps() {
  echo "\n=== T5 experiments sweep ==="
  for finetune in "${T5_FINETUNE_OPTIONS[@]}"; do
    for lr in "${T5_LR_LIST[@]}"; do
      for bs in "${T5_BATCH_SIZES[@]}"; do
        for epoch in "${T5_EPOCHS[@]}"; do
          for seed in "${T5_SEEDS[@]}"; do
            typ="$( [ "$finetune" = true ] && echo ft || echo scr )"
            exp_name="t5_${typ}_lr${lr}_bs${bs}_e${epoch}_s${seed}"
            cmd=("python $REPO_ROOT/train_t5.py --experiment_name $exp_name --learning_rate $lr --batch_size $bs --test_batch_size $bs --max_n_epochs $epoch --seed $seed")
            if [ "$finetune" = true ]; then
              cmd+=("--finetune")
            fi
            # log to file
            logfile="$LOGS_DIR/${exp_name}.log"
            run_cmd "${cmd[*]} 2>&1 | tee $logfile"
          done
        done
      done
    done
  done
}

# 3) Prompting ablation sweeps and k-sweeps
run_prompting_sweeps() {
  echo "\n=== Prompting experiments and ablation sweeps ==="

  # ablation variants (suite)
  if [ "$ONLY" = "all" ] || [ "$ONLY" = "prompt-ablation" ] || [ "$ONLY" = "prompt" ]; then
    for variant in "${PROMPT_VARIANTS[@]}"; do
      vname="$variant"
      if [ -z "$vname" ]; then vname="base"; fi
      exp_name="${PROMPT_EXPERIMENT_PREFIX}_${vname}"
      # run all ks for this variant
      for k in "${PROMPT_KS[@]}"; do
        cmd=("python $REPO_ROOT/prompting.py --shot $k --model $PROMPT_MODEL --experiment_name $exp_name")
        if [ "$PROMPT_QUANTIZE" -eq 1 ]; then cmd+=("--quantization"); fi
        if [ "$variant" != "" ]; then cmd+=("--variant $variant"); fi
        logfile="$LOGS_DIR/${exp_name}_k${k}.log"
        run_cmd "${cmd[*]} 2>&1 | tee $logfile"
      done
    done
  fi

  # an optional dedicated k-sweep for the 'base' prompt
  if [ "$ONLY" = "all" ] || [ "$ONLY" = "prompt-ksweep" ]; then
    for k in "${PROMPT_KS[@]}"; do
      exp_name="${PROMPT_EXPERIMENT_PREFIX}_ksweep"
      cmd=("python $REPO_ROOT/prompting.py --shot $k --model $PROMPT_MODEL --experiment_name $exp_name")
      logfile="$LOGS_DIR/${exp_name}_k${k}.log"
      run_cmd "${cmd[*]} 2>&1 | tee $logfile"
    done
  fi
}

# Main dispatch
case "$ONLY" in
  all)
    run_stats_and_prep
    run_t5_sweeps
    run_prompting_sweeps
    ;;
  stats)
    run_stats_and_prep
    ;;
  t5)
    run_t5_sweeps
    ;;
  prompt)
    run_prompting_sweeps
    ;;
  prompt-ablation)
    run_prompting_sweeps
    ;;
  prompt-ksweep)
    run_prompting_sweeps
    ;;
  *)
    echo "Unknown --only value: $ONLY"; exit 1
    ;;
esac

echo "\nAll done (dry-run=$DRY_RUN). Logs: $LOGS_DIR"