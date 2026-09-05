#!/usr/bin/env bash

if pgrep -x "hypridle" >/dev/null ;then
  notify-send "Hypridle turned off"
  killall hypridle
else
  notify-send "Hypridle started"
  hypridle
fi
