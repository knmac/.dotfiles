#!/usr/bin/env bash
KEY_BINDINGS="$HOME/.config/polybar/scripts/keybindings.csv"

parse_keys() {
    awk 'BEGIN {FS = ","}; {printf("<b>%-35s</b>%s\n", $1, $2)} ' $KEY_BINDINGS
}

ans=$( parse_keys | rofi -i -dmenu -p "  Key bindings" -markup-rows -theme-str "element-icon { padding: 0;}" )

echo $ans | awk 'BEGIN {FS = "</b>"}; {print $2}'
