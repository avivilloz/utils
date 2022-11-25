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
		blender \
		audacity \
		obs-studio \
		kdenlive \
		inkscape \
		krita \
		gimp \
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
		steam

	yay -S --needed \
		aseprite \
		huiontablet \
		pureref \
		proton-ge-custom-bin \
		mpdris2

	sudo systemctl enable --now mpd
fi
