#!/bin/bash

set -e

# for every file in ~/bin that starts with "dot_",
# make a symlinked dotfile in ~ that maps to that file in ~/bin
for source_file in $(find . -name "dot_*" -maxdepth 1)
do
    target_file=${source_file/.\/dot_/.}
    ln -fs `pwd`/$source_file ~/$target_file
done

touch local_bash_config
touch ~/.local_vimrc
rm -rf ~/.vim_backup
mkdir ~/.vim_backup

