#!/bin/bash

MAIN_DIR="$HOME/Pictures/Screenshots"

# Current Year and Month
YEAR=$(date '+%Y')

MONTH_NUM=$(date '+%m' | sed 's/^0//')
case $MONTH_NUM in
    1) MONTH="January" ;;
    2) MONTH="February" ;;
    3) MONTH="March" ;;
    4) MONTH="April" ;;
    5) MONTH="May" ;;
    6) MONTH="June" ;;
    7) MONTH="July" ;;
    8) MONTH="August" ;;
    9) MONTH="September" ;;
    10) MONTH="October" ;;
    11) MONTH="November" ;;
    12) MONTH="December" ;;
esac

SAVE_DIR="$MAIN_DIR/$YEAR/$MONTH"
mkdir -p "$SAVE_DIR"

NAME="$(date '+%Y-%m-%d_%H-%M-%S').png"

scrot "$SAVE_DIR/$NAME"

echo "Screenshot saved to $SAVE_DIR/$NAME"
