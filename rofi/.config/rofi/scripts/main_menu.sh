#!/bin/bash

CHOSEN=$(printf "🖥️ Screen\n⚡ Power\n🌐 VPN\n" | rofi -dmenu -p "Menu")

case "$CHOSEN" in
"🖥️ Screen") ~/.config/rofi/scripts/screen_menu.sh ;;
"⚡ Power") ~/.config/rofi/scripts/power_menu.sh ;;
"🌐 VPN") ~/.config/rofi/scripts/vpn_menu.sh ;;
*) exit 1 ;;
esac
