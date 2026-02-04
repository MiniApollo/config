#!/usr/bin/env bash

killall swaybg

WALLPAPER_DIRECTORY="$HOME/Pictures/Wallpapers/"
WALLPAPER=$(find "$WALLPAPER_DIRECTORY" -path "*/.git" -prune -o -type f ! -name "README.md" -print | shuf -n 1)

swaybg -o \* -i ${WALLPAPER} -m fill &
