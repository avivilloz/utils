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
	read ans
	if [ $ans  = "y" ]; then
		ln -sf /usr/share/zoneinfo/Israel /etc/localtime
	fi

	echo "hwclock --systohc"
	read ans
	if [ $ans  = "y" ]; then
		hwclock --systohc
	fi

	echo "vim /etc/locale.gen"
	read ans
	if [ $ans  = "y" ]; then
		vim /etc/locale.gen
	fi

	echo "locale-gen"
	read ans
	if [ $ans  = "y" ]; then
		locale-gen
	fi

	echo "echo LANG=en_US.UTF-8 > /etc/locale.conf"
	read ans
	if [ $ans  = "y" ]; then
		echo LANG=en_US.UTF-8 > /etc/locale.conf
	fi

	echo "hostnamectl set-hostname $hostname"
	read ans
	if [ $ans  = "y" ]; then
		hostnamectl set-hostname $hostname
	fi

	echo "echo "127.0.0.1	localhost\n::1	localhost\n127.0.1.1	$hostname" > /etc/hosts"
	read ans
	if [ $ans  = "y" ]; then
		echo "127.0.0.1	localhost\n::1	localhost\n127.0.1.1	$hostname" > /etc/hosts
	fi

	echo "vim /etc/hosts"
	read ans
	if [ $ans  = "y" ]; then
		vim /etc/hosts
	fi

	echo "passwd"
	read ans
	if [ $ans  = "y" ]; then
		passwd
	fi

	echo "useradd -m -G wheel $user"
	read ans
	if [ $ans  = "y" ]; then
		useradd -m -G wheel $user
	fi

	echo "passwd $user"
	read ans
	if [ $ans  = "y" ]; then
		passwd $user
	fi

	echo "vim /etc/sudoers"
	read ans
	if [ $ans  = "y" ]; then
		vim /etc/sudoers
	fi

	echo "pacman -S grub efibootmgr"
	read ans
	if [ $ans  = "y" ]; then
		pacman -S grub efibootmgr
	fi

	echo "grub-install --target=x86_64-efi --bootloader-id=arch-grub --efi-directory=/boot/efi"
	read ans
	if [ $ans  = "y" ]; then
		grub-install --target=x86_64-efi --bootloader-id=arch-grub --efi-directory=/boot/efi
	fi

	echo "grub-mkconfig -o /boot/grub/grub.cfg"
	read ans
	if [ $ans  = "y" ]; then
		grub-mkconfig -o /boot/grub/grub.cfg
	fi

	echo "pacman -S networkmanager"
	read ans
	if [ $ans  = "y" ]; then
		pacman -S networkmanager
	fi

	echo "systemctl enable NetworkManager"
	read ans
	if [ $ans  = "y" ]; then
		systemctl enable NetworkManager
	fi

	echo "pacman -S intel-ucode"
	read ans
	if [ $ans  = "y" ]; then
		pacman -S intel-ucode
	fi

	echo "pacman -S xorg"
	read ans
	if [ $ans  = "y" ]; then
		pacman -S xorg 
	fi

	echo "pacman -S nvidia nvidia-utils nvidia-settings xf86-video-intel"
	read ans
	if [ $ans  = "y" ]; then
		pacman -S nvidia nvidia-utils nvidia-settings xf86-video-intel
	fi

	echo "vim /etc/pacman.conf"
	read ans
	if [ $ans = "y" ]; then
		vim /etc/pacman.conf
	fi

	echo "setup chaotic aur"
	read ans
	if [ $ans = "y" ]; then
		pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
		pacman-key --lsign-key FBA220DFC880C036
		pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
		echo "[chaotic-aur]" >> /etc/pacman.conf
		echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
	fi

	echo "vim /etc/systemd/logind.conf"
	read ans
	if [ $ans = "y" ]; then
		vim /etc/systemd/logind.conf
	fi
fi
