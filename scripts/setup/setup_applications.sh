#!/bin/bash

echo -------------------------------------------------------------------------
echo setup applications
echo -------------------------------------------------------------------------

echo do you want to install applications on arch? [y/n]
read ans
if [ $ans  = "y" ]; then
	sudo pacman -S --needed \
		vim \
		git \
		mpv \
		mpc \
		mpd \
		ncmpcpp \
		htop \
		ranger \
		neofetch \
		obsidian \
		bitwarden \
		audacity \
		obs-studio \
		gimp \
		kdenlive \
		godot \
		flameshot \
		libreoffice-fresh \
		virtualbox \
		virtualbox-host-modules-arch \
		timeshift \
		zoom \
		discord \
		stacer \
		visual-studio-code-bin \
		stremio \
		google-chrome \
		solaar \
		steam \
		inkscape \
		krita \
		blender

	yay -S --needed \
		aseprite \
		huiontablet \
		pureref \
		proton-ge-custom-bin \
		mpdris2

	sudo rm /etc/xdg/autostart/huiontablet.desktop
fi
