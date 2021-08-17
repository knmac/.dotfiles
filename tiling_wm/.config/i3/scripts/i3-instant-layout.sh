#!/usr/bin/env bash
# Ref: https://pypi.org/project/i3-instant-layout/
i3-instant-layout --list | rofi -no-lazy-grab -dmenu -i | i3-instant-layout -
