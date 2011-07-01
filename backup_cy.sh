#!/bin/bash

day=`date +%Y-%m-%d`
filename="cy backup $day.tar.gz"
cd /Users/cjb
tar czf "$filename" cy.sparsebundle
mv "$filename" "/Users/cjb/Dropbox/cy backups"
