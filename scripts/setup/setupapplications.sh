#!/bin/bash

echo -------------------------------------------------------------------------
echo setup applications
echo -------------------------------------------------------------------------

echo do you want to ? [y/n]
read ans
if [ $ans  = "y" ]; then
	sudo pacman -S obsidian
	sudo pacman -S bitwarden
	sudo pacman -S blender
	sudo pacman -S audacity
	sudo pacman -S discord
	sudo pacman -S flameshot
	sudo pacman -S gcompris-qt
	sudo pacman -S balena-etcher
	sudo pacman -S github-desktop
	sudo pacman -S firefox-appmenu
	sudo pacman -S gimp
	sudo pacman -S gnucash
	sudo pacman -S godot
	sudo pacman -S htop
	sudo pacman -S inkscape
	sudo pacman -S libreoffice-fresh
	sudo pacman -S mpv
	sudo pacman -S vlc
	sudo pacman -S obs-studio
	sudo pacman -S virtualbox virtualbox-host-modules-arch
	sudo pacman -S qalculate-qt
	sudo pacman -S ranger
	sudo pacman -S timeshift
	sudo pacman -S telegram-qt
	sudo pacman -S stacer
	sudo pacman -S superproductivity-bin
	sudo pacman -S kdenlive
	sudo pacman -S krita
	sudo pacman -S kcharselect
	sudo pacman -S kcolorchooser
	sudo pacman -S ktorrent
	sudo pacman -S sweeper
	sudo pacman -S steam
	sudo pacman -S visual-studio-code-bin
	sudo pacman -S wireshark-qt
	sudo pacman -S zoom
	sudo pacman -S stremio
	sudo pacman -S akregator
	yay -S aseprite
fi
