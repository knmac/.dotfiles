#!/usr/bin/env bash

# Get the path to this file
SCRIPT_DIR=$(dirname $0)

# Get this file's name
THIS_NAME=$(basename $0)

# Auto source all shell scripts in this folder (except this file)
for foo in $SCRIPT_DIR/*.sh; do
    script=$(basename $foo)
    [[ $script == $THIS_NAME ]] && continue
    source "$SCRIPT_DIR/$script"
done
