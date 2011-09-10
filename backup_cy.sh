#!/bin/bash

day=`date +%Y-%m-%d`
filename="cy backup $day.tar.gz"
cd /Users/cjb
tar czf "$filename" tc-cy
mv "$filename" "/Users/cjb/Dropbox/zzz backups"
