#!/bin/bash
set -euo pipefail

ROFI_PROMPT="VPN WireGuard"

CHOSEN=$(printf "🏠 Oros\n🇫🇷 France\n🇧🇪 Belgique\n🇷🇴 Roumanie\n❌ Déconnecter" | rofi -dmenu -p "$ROFI_PROMPT")

[ -z "$CHOSEN" ] && exit 0

case "$CHOSEN" in
"🏠 Oros") TARGET="oros" ;;
"🇫🇷 France") TARGET="fr" ;;
"🇧🇪 Belgique") TARGET="be" ;;
"🇷🇴 Roumanie") TARGET="ro" ;;
"❌ Déconnecter") TARGET="" ;;
*) exit 1 ;;
esac

# ---------- Déconnecter tous les VPN WireGuard actifs ----------
ACTIVE_IFACES=$(wg show interfaces)

for IFACE in $ACTIVE_IFACES; do
  systemctl stop "wg-quick@${IFACE}.service"
done

# ---------- Si on voulait juste déconnecter ----------
[ -z "$TARGET" ] && exit 0

# ---------- Connexion ----------
systemctl start "wg-quick@${TARGET}.service"
