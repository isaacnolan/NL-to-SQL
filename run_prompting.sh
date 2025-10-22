#!/bin/bash

for k in {1..10}
do
    python prompting.py --experiment_name K_Shots_${k} --shot ${k}
done
