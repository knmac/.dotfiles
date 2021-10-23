#!/usr/bin/env bash
IS_RUNNING="/tmp/picom"
if [[ -f "$IS_RUNNING" ]]; then
    killall picom
    rm -f "$IS_RUNNING"
    notify-send --urgency="low" "Picom turned off"
else
    picom --experimental-backends &
    touch "$IS_RUNNING"
    notify-send --urgency="low" "Picom turned on"
fi
