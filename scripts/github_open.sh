#!/bin/bash

function github {
    git remote show -n github |
    grep Fetch |
    cut -d @ -f 2 |
    tr ':' '/' |
    sed s/\.git// |
    sed s#^#https://#
}

open `github`
