#!/usr/bin/env bash
# Wrapper for x2x
sshx2x() {
    echo "USAGE: sshx2x [HOST] [DIRECTION] [DISPLAY_PORT]"

    if [[ -z $1 ]]; then
        echo "Please specify host"
        return 1
    else
        HOST=$1
    fi

    if [[ -z $2 ]]; then
        echo "Please specify direction (north|east|west|south)"
        return 1
    else
        DIRECTION=$2
    fi

    if [[ -z $3 ]]; then
        echo "Please specify display port"
        return 1
    else
        DISPLAY_PORT=$3
    fi

    echo "Connecting to $HOST with DISPLAY=$DISPLAY_PORT. The machine is at the $DIRECTION direction..."
    ssh -XC "$HOST" x2x -"$DIRECTION" -to ":$DISPLAY_PORT"
}
