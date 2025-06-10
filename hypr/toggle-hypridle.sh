#!/usr/bin/env bash

if pgrep -x "hypridle" >/dev/null ;then
  notify-send "Hypridle killed"
  killall hypridle
else
  notify-send "Hypridle started"
  hypridle
fi
