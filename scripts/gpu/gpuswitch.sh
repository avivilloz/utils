#!/bin/bash

envycontrol --dm sddm -s $1
xsetup="$(cat ~/git/utils/dotfiles/sddm/Xsetup)"
echo "$xsetup" >> /usr/share/sddm/scripts/Xsetup
