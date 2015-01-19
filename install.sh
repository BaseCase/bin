#!/bin/bash

set -e

# for every file in ~/bin that starts with "dot_",
# make a symlinked dotfile in ~ that maps to that file in ~/bin
for file in $(find . -name "dot_*" -maxdepth 1)
do
    source_file=${file##./}                    # strip leading './' from filename
    target_file=${source_file/.\/dot_/.}       # make .foo version of dot_foo filename
    ln -fs `pwd`/$source_file ~/$target_file   # symlink ~/.foo files to bin/dot_foo files
done

touch local_bash_config
touch ~/.local_vimrc
rm -rf ~/.vim_backup
mkdir ~/.vim_backup
