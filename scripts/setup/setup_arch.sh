#!/bin/bash

echo -------------------------------------------------------------------------
echo setup arch linux
echo -------------------------------------------------------------------------

echo do you want to setup arch linux after partitioning and installation of \
	linux, linux-headers, git and vim? [y/n]
read ans
if [ $ans  = "y" ]; then
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
		pacman -S grub efibootmgr
	fi

	echo "mkdir -p /boot/efi"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		mkdir -p /boot/efi
	fi

	echo "efi device: [sda$/nvme0n1p$]"
	read efidevice

	echo "mount /dev/$efidevice /boot/efi"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		mount /dev/$efidevice /boot/efi
	fi

	echo "grub-install --target=x86_64-efi --bootloader-id=arch-grub --efi-directory=/boot/efi"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		grub-install --target=x86_64-efi --bootloader-id=arch-grub --efi-directory=/boot/efi
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
		pacman -S networkmanager
	fi

	echo "systemctl enable NetworkManager"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		systemctl enable NetworkManager
	fi

	echo "vim /etc/pacman.conf"
	echo "[y/n]"
	read ans
	if [ $ans = "y" ]; then
		vim /etc/pacman.conf
	fi

	echo "vim /etc/systemd/logind.conf"
	echo "[y/n]"
	read ans
	if [ $ans = "y" ]; then
		vim /etc/systemd/logind.conf
	fi

	echo "pacman -S intel-ucode"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		pacman -S intel-ucode
	fi

	echo "pacman -S xorg"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		pacman -S xorg xorg-xwayland
	fi

	echo "pacman -S nvidia nvidia-utils nvidia-settings"
	echo "[y/n]"
	read ans
	if [ $ans  = "y" ]; then
		pacman -S nvidia nvidia-utils nvidia-settings lib32-nvidia-utils mesa lib32-mesa xf86-video-intel vulkan-intel
	fi
fi
