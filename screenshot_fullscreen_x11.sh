#!/bin/bash

MAIN_DIR="$HOME/Pictures/Screenshots"

YEAR=$(date '+%Y')
MONTH=$(date '+%B')
SAVE_DIR="$MAIN_DIR/$YEAR/$MONTH"
mkdir -p "$SAVE_DIR"

NAME="$(date '+%Y-%m-%d_%H-%M-%S').png"
FILE="$SAVE_DIR/$NAME"

# Default mode = monitor
MODE=${1:-monitor}

if [ "$MODE" = "window" ]; then
    # Capture active window
    scrot -u "$FILE"
    xclip -selection clipboard -t image/png -i "$FILE"
    notify-send "📸 Screenshot (window)" "Saved & copied: $FILE"
else
    # Capture monitor containing active window
    ACTIVE_WIN=$(xdotool getactivewindow)
    GEOMETRY=$(xwininfo -id "$ACTIVE_WIN" | awk '/Absolute upper-left X|Absolute upper-left Y|Width|Height/ {print $NF}' | tr '\n' ' ')
    read X Y W H <<< "$GEOMETRY"

    MONITOR=$(xrandr --current | awk '/ connected/ {print $1,$3}' | while read name geom; do
        MONX=$(echo $geom | cut -d+ -f2)
        MONY=$(echo $geom | cut -d+ -f3)
        MONW=$(echo $geom | cut -d'x' -f1)
        MONH=$(echo $geom | cut -d'x' -f2 | cut -d+ -f1)
        if (( X >= MONX && X < MONX+MONW && Y >= MONY && Y < MONY+MONH )); then
            echo "$MONX,$MONY,$MONW,$MONH"
            break
        fi
    done)

    IFS=, read MX MY MW MH <<< "$MONITOR"
    scrot -a $MX,$MY,$MW,$MH "$FILE"
    xclip -selection clipboard -t image/png -i "$FILE"
    notify-send "🖥️ Screenshot (monitor)" "Saved & copied: $FILE"
fi

