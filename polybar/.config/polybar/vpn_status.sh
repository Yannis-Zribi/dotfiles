#!/bin/bash

# Liste des interfaces WireGuard actives
ACTIVE_WG=$(wg show interfaces 2>/dev/null)

if [[ -z "$ACTIVE_WG" ]]; then
  echo "%{F#A00E0E}VPN%{F-} %{F#707880}disconnected%{F-}"
else
  echo "%{F#136F00}VPN%{F-} %{F#C5C8C6}$ACTIVE_WG%{F-}"
fi
