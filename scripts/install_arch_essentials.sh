#!/bin/bash

#pacman -S linux linux-firmware base
#pacman -S base-devel

pacman -S os-prober 
pacman -S dosfstools 
pacman -S mtools 

pacman -S network-manager-applet 
pacman -S networkmanager 
pacman -S wireless_tools 
pacman -S dhcpcd
pacman -S dialog 

pacman -S grub efibootmgr

pacman -S sudo
pacman -S vim
pacman -S git
