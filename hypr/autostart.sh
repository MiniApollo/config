#!/bin/sh

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}
killall gammastep

run gammastep -l 47.55:19.09 
run gentoo-pipewire-launcher restart
run thunar --daemon 
run ~/SystemFiles/dynamic-wallpaper-wayland/wallpaper.sh
