#!/bin/bash

set -e

filename=$1

function repo_name {
    git remote -v |
    grep -m 1 "git@.*\.git" |
    awk '{print $2}' |
    cut -d ':' -f 2 |
    sed s/\.git//
}

function branch_name {
    git status |
    grep "On branch" |
    cut -d ' ' -f 4
}

function path_to_file {
    git ls-files --full-name $filename
}

function github_blame_url {
    echo "https://github.com/$(repo_name)/blame/$(branch_name)/$(path_to_file)"
}

open `github_blame_url`
