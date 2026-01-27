#!/bin/bash

CHOSEN=$(printf "🔒 Lock\n🔴 Shutdown\n🟠 Reboot\n" | rofi -dmenu)

case "$CHOSEN" in
"🔒 Lock") i3lock -c 000000 ;;
"🔴 Shutdown") poweroff ;;
"🟠 Reboot") reboot ;;
*) exit 1 ;;
esac
