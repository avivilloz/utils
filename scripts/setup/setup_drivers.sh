#!/bin/bash
#
echo -------------------------------------------------------------------------
echo setup desktop environment
echo -------------------------------------------------------------------------

echo do you want to install intel-ucode for Intel CPU? [y/n]
read ans
if [ $ans  = "y" ]; then
	sudo pacman -S --needed intel-ucode
fi

echo do you want to install intel drivers for Intel GPU? [y/n]
read ans
if [ $ans  = "y" ]; then
	sudo pacman -S --needed mesa lib32-mesa xf86-video-intel vulkan-intel
fi

echo do you want to install nvidia drivers for Nvidia GPU? [y/n]
read ans
if [ $ans  = "y" ]; then
	sudo pacman -S --needed nvidia nvidia-utils nvidia-settings lib32-nvidia-utils mesa-utils
	sudo sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="nvidia-drm.modeset=1"/g' /etc/default/grub
	sudo grub-mkconfig -o /boot/grub/grub.cfg
fi

echo do you want to install envycontrol for handling of hybrid GPUs? [y/n]
read ans
if [ $ans  = "y" ]; then
	yay -S --needed envycontrol
fi
