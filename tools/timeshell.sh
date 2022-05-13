#!/usr/bin/env bash
timeshell() {
    shell=${1-$SHELL}
    for _ in $(seq 1 10); do
        /usr/bin/time -f "\t%E real,\t%U user,\t%S sys" "$shell" -i -c exit;
    done
}
