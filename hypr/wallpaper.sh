#!/usr/bin/env bash

killall swaybg

WALLPAPER_DIRECTORY="$HOME/Pictures/Wallpapers/"
WALLPAPER=$(find "$WALLPAPER_DIRECTORY" -type f | shuf -n 1)

swaybg -o \* -i ${WALLPAPER} -m fill &
