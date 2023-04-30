#!/bin/sh

background=light

# A specific mode (light/dark) can be forced from the command line
if [ -n "$1" ] && [ "$1" != "$background" ]; then
  # This is not that intuitive but if the requested mode is different from the
  # next mode then the _current_ mode is the same as the requested one and there
  # is nothing to do
  exit 0
fi

if [ $background = light ]; then
    sed -i s/Arc-Lighter/Arc-Dark/ ~/.xsettingsd
    background=dark

else
    sed -i s/Arc-Dark/Arc-Lighter/ ~/.xsettingsd
    background=light
fi

killall -HUP xsettingsd
