#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}
killall gammastep

run dunst
run gammastep -l 47.55:19.09
run thunar --daemon
run nm-applet
