#!/bin/sh

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}
killall redshift

run picom 
run redshift -l 47.55:19.09 
run nm-applet 
run dwall -s firewatch 
run thunar --daemon 
