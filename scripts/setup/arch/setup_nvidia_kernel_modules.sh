#!/bin/bash

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
Exec=/bin/sh -c 'while read -r trg; do case \$trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'" | sudo tee -a /etc/pacman.d/hooks/nvidia.hook > /dev/null
	
	sudo mkdir -p /etc/udev/rules.d/
	echo 'ACTION=="add", DEVPATH=="/bus/pci/drivers/nvidia", RUN+="/usr/bin/nvidia-modprobe -c0 -u"' | sudo tee -a /etc/udev/rules.d/70-nvidia.rules > /dev/null
fi

echo do you want to disable Nvidia kernel modules? [y/n]
read ans
if [ $ans  = "y" ]; then
	sudo sed -i 's/GRUB_CMDLINE_LINUX="nvidia-drm.modeset=1"/GRUB_CMDLINE_LINUX=""/g' /etc/default/grub
	sudo grub-mkconfig -o /boot/grub/grub.cfg

	sudo sed -i 's/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/MODULES=()/g' /etc/mkinitcpio.conf
	sudo mkinitcpio -P

	sudo rm -rf /etc/pacman.d/hooks/nvidia.hook
	
	sudo rm -rf /etc/udev/rules.d/70-nvidia.rules
fi
