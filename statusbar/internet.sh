#!/bin/sh

# Handle button clicks
case $BLOCK_BUTTON in
    1) pamixer -t; kill -44 $(pidof dwmblocks) ;;
    2) rofi -theme "~/.config/rofi/themes/gruvbox/gruvbox-dark.rasi" -e "Audio clicked" ;;
    3) rofi -theme "~/.config/rofi/themes/gruvbox/gruvbox-dark.rasi" -e "Audio clicked" ;;
    4) pamixer --allow-boost -i 1; kill -44 $(pidof dwmblocks) ;;
    5) pamixer --allow-boost -d 1; kill -44 $(pidof dwmblocks) ;;
    6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

# Get active connection type and IP using nmcli
connection_type=$(nmcli -t -f TYPE,STATE device | awk -F: '$2 == "connected" {print $1}')
ip_address=$(nmcli -t -f IP4.ADDRESS device show | awk -F: '{print $2}' | head -n 1)

# Determine the correct icon
case "$connection_type" in
    wifi)
        net_icon=" "  # WiFi icon
        connection_type="WiFi"
	# ip_address="Connected"
        ;;
    ethernet)
        net_icon="󰈀 "  # Ethernet icon
        connection_type="Ethernet"
        ;;
    *)
        net_icon=" "  # Disconnected icon
        connection_type="Disconnected"
        ip_address="Disconnected"
        ;;
esac

# Print output
echo "$net_icon $ip_address"

