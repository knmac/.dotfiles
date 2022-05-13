#!/usr/bin/env bash
# Wrapper over `dict` command for better output
# Dependecies: dict, colorit
lookup() {
    echo "Usage: lookup [WORD]"
    if [[ -z "$1" ]]; then
        echo "Please input the word you want to look up"
        return 1
    else
        WORD="$1"
    fi

    dict "$WORD" | colorit | less
}
