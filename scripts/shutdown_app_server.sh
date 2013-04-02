#!/bin/bash

for i in {0..4} ; do
    screen -p $i -X stuff ''
    screen -p $i -X kill
done
