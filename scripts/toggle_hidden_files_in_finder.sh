#!/bin/bash

# quick way to show or hide hidden files in Mac OS's Finder
if [ `defaults read com.apple.finder AppleShowAllFiles` == "TRUE" ]; then
    defaults write com.apple.finder AppleShowAllFiles FALSE
else
    defaults write com.apple.finder AppleShowAllFiles TRUE
fi

killall Finder
