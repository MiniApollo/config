#!/usr/bin/env bash

swayidle -w \
timeout 1200 'swaylock && hyprctl dispatch dpms off' \
resume 'hyprctl dispatch dpms on'

#Tip: The hyprctl dispatch dpms on command must come directly after the hyprctl dispatch dpms off command in the script for it to function correctly,
#as the resume command is linked to the previous timeout used.
