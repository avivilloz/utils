#!/bin/bash

echo -------------------------------------------------------------------------
echo setup arch linux
echo -------------------------------------------------------------------------

echo do you want to setup arch linux after partitioning and installation? [y/n]
read ans
if [ $ans  = "y" ]; then
	hostname=avivilloz
	user=avivilloz

	echo "ln -sf /usr/share/zoneinfo/Israel /etc/localtime"
	ln -sf /usr/share/zoneinfo/Israel /etc/localtime

	echo "hwclock --systohc"
	hwclock --systohc

	echo "vim /etc/locale.gen"
	vim /etc/locale.gen

	echo "locale-gen"
	locale-gen

	echo "echo LANG=en_US.UTF-8 > /etc/locale.conf"
	echo LANG=en_US.UTF-8 > /etc/locale.conf

	echo "hostnamectl set-hostname $hostname"
	hostnamectl set-hostname $hostname

	echo "echo "127.0.0.1	localhost\n::1	localhost\n127.0.1.1	$hostname" > /etc/hosts"
	echo "127.0.0.1	localhost\n::1	localhost\n127.0.1.1	$hostname" > /etc/hosts

	echo "vim /etc/hosts"
	vim /etc/hosts

	echo "passwd"
	passwd

	echo "useradd -m -G wheel $user"
	useradd -m -G wheel $user

	echo "passwd $user"
	passwd $user

	echo "vim /etc/sudoers"
	vim /etc/sudoers

	echo "pacman -S grub efibootmgr"
	pacman -S grub efibootmgr

	echo "grub-install --target=x86_64-efi --bootloader-id=arch-grub --efi-directory=/boot/efi"
	grub-install --target=x86_64-efi --bootloader-id=arch-grub --efi-directory=/boot/efi

	echo "grub-mkconfig -o /boot/grub/grub.cfg"
	grub-mkconfig -o /boot/grub/grub.cfg

	echo "pacman -S networkmanager"
	pacman -S networkmanager

	echo "systemctl enable NetworkManager"
	systemctl enable NetworkManager

	echo "pacman -S intel-ucode"
	pacman -S intel-ucode

	echo "pacman -S xorg "
	pacman -S xorg 

	echo "pacman -S nvidia nvidia-utils nvidia-settings xf86-video-intel"
	pacman -S nvidia nvidia-utils nvidia-settings xf86-video-intel
fi
