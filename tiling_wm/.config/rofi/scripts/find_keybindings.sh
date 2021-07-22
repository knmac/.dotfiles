#!/usr/bin/env bash
KEY_BINDINGS=$(dirname $0)"/keybindings.csv"

parse_keys() {
    #awk 'BEGIN {FS = ","}; {printf("<b>%-35s</b>%s\n", $1, $2)} ' $KEY_BINDINGS
    awk 'BEGIN {FS = ","}; {printf("%-35s%s\n", $1, $2)} ' $KEY_BINDINGS
}

#ans=$( parse_keys | rofi -i -dmenu -p "  Key bindings" -markup-rows -theme-str "element-icon { padding: 0;}" )
ans=$( parse_keys | rofi -i -dmenu -p "  Key bindings" -theme-str "element-icon { padding: 0;}" )
