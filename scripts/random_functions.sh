#!/bin/bash

set -e

current_git_branch() {
    git status |
    grep "# On branch" |
    cut -d ' ' -f 4
}

git_merge_current_remote_branch() {
    git merge github/$(current_git_branch)
}
