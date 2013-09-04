#!/bin/bash

for i in {0..6} ; do
    screen -p $i -X stuff ''
    screen -p $i -X kill
done
