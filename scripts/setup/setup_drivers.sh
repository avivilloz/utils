#!/bin/bash
#
echo -------------------------------------------------------------------------
echo setup desktop environment
echo -------------------------------------------------------------------------

echo do you want to install intel-ucode for intel cpu? [y/n]
read ans
if [ $ans  = "y" ]; then
	pacman -S intel-ucode
fi

echo do you want to install intel drivers for intel gpu? [y/n]
read ans
if [ $ans  = "y" ]; then
	pacman -S mesa lib32-mesa xf86-video-intel vulkan-intel
fi

echo do you want to install nvidia drivers for nvidia gpu? [y/n]
read ans
if [ $ans  = "y" ]; then
	pacman -S nvidia nvidia-utils nvidia-settings lib32-nvidia-utils
fi
