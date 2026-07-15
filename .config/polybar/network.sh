#!/bin/bash

# Path to a temp file to track the "show details" state
STATE_FILE="/tmp/polybar_net_state"

# Detect the active interface
interface=$(ip route get 1.1.1.1 2>/dev/null | grep -oP 'dev \K\S+')

# Determine the icon
if [ -z "$interface" ]; then
    icon="%{F#f38ba8}󰤮%{F-}" # Offline
else
    [[ "$interface" == e* ]] && icon="%{F#89b4fa}󰈀%{F-}" || icon="%{F#89b4fa}󰤨%{F-}"
fi

# If the state file exists, show full details
if [ -f "$STATE_FILE" ]; then
    if [ -z "$interface" ]; then
        echo "$icon Offline"
    else
        ip_addr=$(ip addr show "$interface" | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
        mac_addr=$(cat "/sys/class/net/$interface/address")
        echo "$icon $ip_addr %{F#6c7086}($mac_addr)%{F-}"
    fi
else
    # Just show the icon
    echo "$icon"
fi
