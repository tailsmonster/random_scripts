#!/bin/bash

MAIN_DIR="$HOME/Pictures/Screenshots"

# Get current year and month
YEAR=$(date '+%Y')
MONTH=$(date '+%B') # simpler than your case/switch
SAVE_DIR="$MAIN_DIR/$YEAR/$MONTH"
mkdir -p "$SAVE_DIR"

# Name format
NAME="$(date '+%Y-%m-%d_%H-%M-%S').png"

# Use Coreshot and save the image
# coreshot --selection "$SAVE_DIR/$NAME"

# Launch coreshot in selection mode, unmanaged
env SDL_VIDEO_X11_OVERRIDE_REDIRECT=1 \
    SDL_VIDEO_X11_WMCLASS=Coreshot \
    SDL_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR=0 \
    coreshot --selection "$SAVE_DIR/$NAME"

#notify-send "Screenshot saved to $SAVE_DIR/$NAME"
