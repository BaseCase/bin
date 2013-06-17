#!/bin/bash

set -e

app_name="$1"

function get_timing_for_one_run() {
    ./manage.py test $app_name 2>&1 |
    grep "^Ran" |
    cut -d ' ' -f 5 |
    tr -d 's'
}

acc=0
for i in {1..20}
do
    once=$(get_timing_for_one_run)
    echo "Run #$i: $once"
    acc=$(echo "$once + $acc" | bc)
done

avg=$(echo "$acc / 20" | bc -l)

echo -e "\n===================="
echo "Total:    $acc"
printf "Average:  %.3f" $avg
echo
