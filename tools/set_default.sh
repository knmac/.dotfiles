#!/usr/bin/env bash
# Set default app to open a filetype
set_default() {
    echo "USAGE: set_default [/path/to/file]"
    if [[ -z "$1" ]]; then
        return
    fi

    FILETYPE=$(xdg-mime query filetype "$1")
    APP=$( find /usr/share ~/.local/share -type f -name "*.desktop" -printf "%p\n" | rofi -threads 0 -dmenu -i -p "Select default app for filetype [$FILETYPE]")
    APP=$(basename -- "$APP")
    xdg-mime default "$APP" "$FILETYPE"
    echo "[$APP] set as default application to open [$FILETYPE]"
}
