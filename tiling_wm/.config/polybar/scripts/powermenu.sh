#!/usr/bin/env bash

uptime=$(uptime -p | sed -e 's/up //g')

#rofi_command="rofi -theme $dir/powermenu.rasi"
rofi_command="rofi"
i3lock_pth="~/.config/i3/i3lock.sh"

# Options
shutdown="  Shutdown"
reboot="  Restart"
lock="  Lock"
suspend="  Sleep"
logout="  Logout"

# Confirmation
confirm_exit() {
    rofi -dmenu\
        -i\
        -no-fixed-num-lines\
        -p "Are You Sure? "
}

# Message
msg() {
    rofi -e "Available Options  -  yes / y / no / n"
}

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -theme-str "listview { scrollbar: false; }" -p "Uptime: $uptime" -dmenu -i -selected-row 0)"
case $chosen in
    $shutdown)
        ans=$(confirm_exit &)
        if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
            systemctl poweroff
        elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
            exit 0
        else
            msg
        fi
        ;;
    $reboot)
        ans=$(confirm_exit &)
        if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
            systemctl reboot
        elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
            exit 0
        else
            msg
        fi
        ;;
    $lock)
        exec $i3lock_pth
        ;;
    $suspend)
        ans=$(confirm_exit &)
        if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
            mpc -q pause
            #amixer set Master mute
            systemctl suspend
        elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
            exit 0
        else
            msg
        fi
        ;;
    $logout)
        ans=$(confirm_exit &)
        if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
            if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
                openbox --exit
            elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
                bspc quit
            elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
                i3-msg exit
            fi
        elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
            exit 0
        else
            msg
        fi
        ;;
esac
