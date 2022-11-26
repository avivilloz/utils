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

	echo do you want to enable Nvidia kernel modules? [y/n]
	read ans
	if [ $ans  = "y" ]; then
		sudo sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="nvidia-drm.modeset=1"/g' /etc/default/grub
		sudo grub-mkconfig -o /boot/grub/grub.cfg

		sudo sed -i 's/MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/g' /etc/mkinitcpio.conf
		sudo mkinitcpio -P

		sudo mkdir -p /etc/pacman.d/hooks/
		echo "\
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=nvidia
Target=linux
# Change the linux part above and in the Exec line if a different kernel is used

[Action]
Description=Update NVIDIA module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'" \
		| sudo tee -a /etc/pacman.d/hooks/nvidia.hook > /dev/null
		
		sudo mkdir -p /etc/udev/rules.d/
		echo 'ACTION=="add", DEVPATH=="/bus/pci/drivers/nvidia", RUN+="/usr/bin/nvidia-modprobe -c0 -u"' | sudo tee -a /etc/udev/rules.d/70-nvidia.rules > /dev/null
	fi

	echo do you want to force GBM as backend for Nvidia driver? [y/n]
	read ans
	if [ $ans  = "y" ]; then
		echo export GBM_BACKEND=nvidia-drm >> ~/.bash_profile
		echo export __GLX_VENDOR_LIBRARY_NAME=nvidia >> ~/.bash_profile
	fi
fi

echo do you want to install envycontrol for handling of hybrid GPUs? [y/n]
read ans
if [ $ans  = "y" ]; then
	yay -S --needed envycontrol
fi
