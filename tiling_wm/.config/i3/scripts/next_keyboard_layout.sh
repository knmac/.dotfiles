#!/usr/bin/env bash
LAYOUT_LST=("xkb:us::eng" "Unikey" "mozc-jp")  # use `ibus list-engine` to check the names
REF_LST=("[EN]" "[VN]" "[JP]")  # corresponding language of the layouts

# Get the current layout
current_layout="$(ibus engine)"

# Find index of the current layout
for idx in "${!LAYOUT_LST[@]}"; do
    [[ "${LAYOUT_LST[$idx]}" = "${current_layout}" ]] && break
done

# Get the next layout
next_idx="$(( (idx + 1) % 3 ))"
next_layout="${LAYOUT_LST[$next_idx]}"

# Set layout and notify
ibus engine "$next_layout"
if type notify-send &> /dev/null; then
    #notify-send --urgency="low" \
    #    "Keyboard layout changed:" \
    #    "<b>${REF_LST[$idx]}</b> $current_layout --> <b>${REF_LST[$next_idx]}</b> $next_layout"
    notify-send --urgency="low" "Keyboard layout changed:" "<b>${REF_LST[$next_idx]}</b> $next_layout"
fi
