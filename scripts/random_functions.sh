#!/bin/bash

current_git_branch() {
    git branch |
    grep "^\*" |
    cut -d ' ' -f 2
}

git_merge_current_remote_branch() {
    git merge github/$(current_git_branch)
}

forward_port() {
    if [ -z "$1" ]; then
        echo "Usage: forward_port <USERNAME> <HOSTNAME> <PORT>"
    else
        ssh $1@$2 -L $3:$2:$3 -N
    fi
}

toggle_hidden_files_in_finder() {
    if [ `defaults read com.apple.finder AppleShowAllFiles` == "TRUE" ]; then
        defaults write com.apple.finder AppleShowAllFiles FALSE
    else
        defaults write com.apple.finder AppleShowAllFiles TRUE
    fi
    killall Finder
}

retag() {
    cd `git rev-parse --show-toplevel`
    ctags -R --python-kinds=-i
    cd -
}

