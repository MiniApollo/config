#!/bin/sh

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run picom 
run redshift -l 47.55:19.09 
run optimus-manager-qt 
run nm-applet 
run dwall -s firewatch 
run thunar --daemon 
