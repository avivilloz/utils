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
		mpc \
		mpd \
		ncmpcpp \	
		neofetch \
		ranger \
		obsidian \
		bitwarden \
		blender \
		audacity \
		obs-studio \
		kdenlive \
		krita \
		gimp \
		flameshot \
		godot \
		htop \
		inkscape \
		libreoffice-fresh \
		mpv \
		virtualbox \
		virtualbox-host-modules-arch \
		timeshift \
		zoom \
		discord \
		telegram-qt \
		stacer \
		sweeper \
		visual-studio-code-bin \
		wireshark-qt \
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
