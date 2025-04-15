#!/bin/sh

# Power menu script using tofi

CHOSEN=$(printf "🔐 Lock\n🟠 Reboot\n🔴 Shutdown\n🖥️ Copy Screen\n" | rofi -dmenu)

case "$CHOSEN" in
"🔐 Lock") i3lock -c 000000 ;;
"🟠 Reboot") reboot ;;
"🔴 Shutdown") poweroff ;;
"🖥️ Copy Screen") xrandr --output HDMI-A-0 --mode 1920x1080 --same-as eDP ;;

*) exit 1 ;;
esac
