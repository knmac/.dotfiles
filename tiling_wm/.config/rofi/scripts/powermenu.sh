#!/usr/bin/env bash

uptime=$(uptime -p | sed -e 's/up //g')

#rofi_command="rofi -theme $dir/powermenu.rasi"
rofi_command="rofi -theme $HOME/.config/rofi/powermenu_theme.rasi"
i3lock_pth="~/.config/i3/scripts/i3lock.sh"

# Options
shutdown="  Shutdown"
  reboot="   Restart"
    lock="    Lock  "
 suspend="    Sleep "
  logout="   Logout "

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

# Get machine type
machine_type="$(hostnamectl status | grep 'Chassis' | awk '{split($0, ret, "Chassis: "); print ret[2]}')"

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -i -selected-row 0)"
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
            if [[ "$machine_type" == "laptop" ]]; then
                systemctl hybrid-sleep
            else
                systemctl suspend
            fi
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
