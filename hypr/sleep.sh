#!/usr/bin/env bash

swayidle -w \
timeout 600 'hyprctl dispatch dpms off' \
resume 'hyprctl dispatch dpms on' \
timeout 900 'swaylock' \
timeout 1800 'loginctl suspend' \
before-sleep 'swaylock'

#Tip: The hyprctl dispatch dpms on command must come directly after the hyprctl dispatch dpms off command in the script for it to function correctly,
#as the resume command is linked to the previous timeout used.
