#!/bin/bash

set -e

for source_file in $(find . -name "dot_*" -maxdepth 1)
do
    target_file=${source_file/.\/dot_/.}
    ln -fs `pwd`/$source_file ~/$target_file
done

touch local_bash_config

