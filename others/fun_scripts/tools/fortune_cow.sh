#!/usr/bin/env bash
fortune_cow() {
    if [ -z $1 ]; then
        SLEEP=10
    else
        SLEEP=$1
    fi

    while true; do
        clear && fortune | cowsay -f $(ls /usr/share/cowsay/cows | shuf -n 1) | lolcat
        sleep $SLEEP
    done
}
