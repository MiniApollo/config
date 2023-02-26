#!/bin/sh

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run nm-applet 
run picom 
run dwall -s firewatch 
run optimus-manager-qt 
run thunar --daemon 
run redshift -l 47.55:19.09 
