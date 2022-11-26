#!/bin/bash

echo -------------------------------------------------------------------------
echo setup arch linux
echo -------------------------------------------------------------------------

echo do you want to setup arch linux after partitioning and installation of \
	base, base-devel, linux, linux-firmware, linux-headers, git and vim? [y/n]
read ans
if [ $ans  = "y" ]; then

	echo blacklist pcspkr >> /etc/modprobe.d/blacklist.conf
	echo "ln -sf /usr/share/zoneinfo/Israel /etc/localtime"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		ln -sf /usr/share/zoneinfo/Israel /etc/localtime
	fi

	echo "hwclock --systohc"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		hwclock --systohc
	fi

	echo "vim /etc/locale.gen"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		vim /etc/locale.gen
	fi

	echo "locale-gen"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		locale-gen
	fi

	echo "echo LANG=en_US.UTF-8 > /etc/locale.conf"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		echo LANG=en_US.UTF-8 > /etc/locale.conf
	fi

	echo "hostname:"
	read hostname

	echo "hostnamectl set-hostname $hostname"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		hostnamectl set-hostname $hostname
	fi

	echo "echo 127.0.0.1	localhost >> /etc/hosts"
	echo "echo ::1			localhost >> /etc/hosts"
	echo "echo 127.0.1.1	$hostname >> /etc/hosts"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		echo "127.0.0.1	localhost" >> /etc/hosts
		echo "::1		localhost" >> /etc/hosts
		echo "127.0.1.1	$hostname" >> /etc/hosts
	fi

	echo "vim /etc/hosts"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		vim /etc/hosts
	fi

	echo "passwd"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		passwd
	fi

	echo "user:"
	read user

	echo "useradd -m -G wheel $user"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		useradd -m -G wheel $user
	fi

	echo "passwd $user"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		passwd $user
	fi

	echo "vim /etc/sudoers"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		vim /etc/sudoers
	fi

	echo "pacman -S grub efibootmgr"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		pacman -S --needed grub efibootmgr
	fi

	echo "grub-install --target=x86_64-efi --bootloader-id=archlinux --efi-directory=/boot"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		grub-install --target=x86_64-efi --bootloader-id=archlinux --efi-directory=/boot
	fi

	echo "grub-mkconfig -o /boot/grub/grub.cfg"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		grub-mkconfig -o /boot/grub/grub.cfg
	fi

	echo "pacman -S networkmanager"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		pacman -S --needed networkmanager
	fi

	echo "systemctl enable NetworkManager"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		systemctl enable NetworkManager
	fi

	echo "systemctl enable bluetooth"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		systemctl enable bluetooth
	fi

fi
