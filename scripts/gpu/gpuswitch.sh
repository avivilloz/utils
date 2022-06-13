#!/bin/bash

envycontrol --dm sddm -s $1

echo "
intern=eDP-1-1
mon1=HDMI-0

if [ xrandr | grep \"\$mon1 connected\" ]; then
    xrandr --output \$intern --off
    xrandr --output \$mon1 --mode 1920x1080 --pos 0x0 --rotate normal
else
    xrandr --output \$intern --mode 1920x1080 --pos 0x0 --rotate normal 
fi" >> /usr/share/sddm/scripts/Xsetup
