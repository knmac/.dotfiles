#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using config location ~/.config/polybar/config_bspwm
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        # get the screen rotation
        rot=$(xrandr --verbose | grep "$m" | grep -E -o " (normal) ")
        # select the bar name wrt rotation
        if [[ $rot == " normal " ]]; then
            bar_name="mybar"
        else
            bar_name="mybar_vert"
        fi
        # launch the bar on the correct monitor
        MONITOR=$m polybar --reload $bar_name --config="$HOME/.config/polybar/config_bspwm" &
    done
else
    polybar --reload mybar --config="$HOME/.config/polybar/config_bspwm" &
fi

echo "Polybar launched..."
