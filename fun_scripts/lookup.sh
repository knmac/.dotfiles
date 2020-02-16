#!/usr/bin/env bash
if [ -z $1 ]; then
    echo "Please input the word you want to look up"
    echo "Usage:"
    echo "lookup [WORD]"
    exit
else
    WORD=$1
fi

dict $WORD | colorit | less
