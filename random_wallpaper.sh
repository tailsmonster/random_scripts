#!/bin/bash

DIR="$HOME/Pictures/Wallpapers"


CONFIG="$HOME/.config/nitrogen/bg-saved.cfg"
KEY="file="

CURRENT_WALLPAPER=$(grep "^$KEY" "$CONFIG" | cut -d'=' -f2)

while true; do
	RANDOM_WALLPAPER=$(find "$DIR" -type f | shuf -n 1)
	if [[ "$RANDOM_WALLPAPER" == "$CURRENT_WALLPAPER" ]]; then
		echo "Rerolling!"
	else
		echo "New Wallpaper Chosen!"
		break
	fi
done

sed -i "2s|.*|$KEY$RANDOM_WALLPAPER|" "$CONFIG"
nitrogen --restore

echo ""
echo "Wallpaper has been updated to $RANDOM_WALLPAPER"
