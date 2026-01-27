#!/bin/bash

CHOSEN=$(printf "🟠 Reboot\n🔴 Shutdown\n🖥️ Duplicate Screen\n🖥️ Extend Screen\n🖥️ Stop Sharing Screen\n" | rofi -dmenu)

case "$CHOSEN" in
"🟠 Reboot") reboot ;;
"🔴 Shutdown") poweroff ;;
"🖥️ Duplicate Screen") xrandr --output HDMI-A-0 --mode 1920x1080 --same-as eDP ;;
"🖥️ Extend Screen") xrandr --output HDMI-A-0 --auto --right-of eDP ;;
"🖥️ Stop Sharing Screen") xrandr --output HDMI-A-0 --off ;;
*) exit 1 ;;
esac
