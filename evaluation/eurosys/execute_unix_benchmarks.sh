#!/bin/bash

## Necessary to set PASH_TOP
export PASH_TOP=${PASH_TOP:-$(git rev-parse --show-toplevel --show-superproject-working-tree)}

unix50_dir="$PASH_TOP/evaluation/unix50/"
unix50_intermediary="${unix50_dir}/intermediary/"
intermediary_dir="$PASH_TOP/evaluation/intermediary/"
results_subdir_prefix="unix50"

## TODO: Choose with flag
maximum_input_size="$((10 * 1024 * 1024 * 1024))" # 10 GB
n_in=16
# maximum_input_size="$((1024 * 1024 * 1024))" # 1 GB
# n_in=4


results_subdir="${results_subdir_prefix}_${n_in}_${maximum_input_size}"

rm -r $unix50_intermediary
mkdir -p $unix50_intermediary
mkdir -p $intermediary_dir
mkdir -p "$PASH_TOP/evaluation/results/${results_subdir}/"

## Make inputs larger and generate scripts and their envs
python3 generate_unix50_scripts.py $unix50_dir $unix50_intermediary $maximum_input_size

for unix50_pipeline in $(ls ${unix50_intermediary} | grep -v "_env" | cut -f 1 -d '.' | sort); do
    echo $unix50_pipeline

    echo "Generating input and intermediary scripts... be patient..."
    python3 "$PASH_TOP/evaluation/generate_microbenchmark_intermediary_scripts.py" \
            $unix50_intermediary $unix50_pipeline $n_in $intermediary_dir

    echo "Executing script with bash and pash..."
    "$PASH_TOP/evaluation/execute_compile_evaluation_script.sh" -s -a "${unix50_pipeline}" "${n_in}" "${results_subdir}"  # > /dev/null
    rm -f /tmp/eager*
done
