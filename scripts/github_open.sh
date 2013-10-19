#!/bin/bash

function get_github_url {
    git remote show -n github |
    grep Fetch |
    cut -d @ -f 2 |
    tr ':' '/' |
    sed s/\.git// |
    sed s#^#https://#
}

open `get_github_url`

