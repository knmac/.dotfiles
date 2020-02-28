#!/usr/bin/env bash
connect() {
    echo "USAGE: connect [HOST] [PORT]"

    if [ -z $1 ]; then
        echo "Please specify host"
        return 1
    else
        HOST=$1
    fi

    if [ -z $2 ]; then
        echo "Please specify port"
        return 1
    else
        PORT=$2
    fi

    echo "Port fowarding to $HOST:$PORT"
    ssh -NL $PORT:127.0.0.1:$PORT $HOST
}
