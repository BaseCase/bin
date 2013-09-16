#!/bin/bash

for i in {0..5} ; do
    screen -p $i -X stuff ''
    screen -p $i -X kill
done
