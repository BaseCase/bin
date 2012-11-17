#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: forward_port <USERNAME> <HOSTNAME> <PORT>"
else
    ssh $1@$2 -L $3:$2:$3 -N
fi
