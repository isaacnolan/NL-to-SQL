#!/bin/bash
for k in {2..3}
do
    TS=$(date "+%Y%m%d_%H%M%S")
    python prompting.py --experiment_name K_Shots_Latest2${k}_${TS} --shot ${k} --model gemma --quantization
done
