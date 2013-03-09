#!/bin/bash

for f in `find . -name "dot_*" -maxdepth 1 | xargs`
do
    new_loc=`echo $f | sed s:.*dot_:$HOME/\.:`
    cp -v "$f" "$new_loc"
done
