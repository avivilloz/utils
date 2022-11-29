#!/bin/bash

echo -------------------------------------------------------------------------
echo setup applications
echo -------------------------------------------------------------------------

echo do you want to install applications on arch? [y/n]
read ans
if [ $ans  = "y" ]; then
	sudo pacman -Syy
	sudo pacman -S --needed \
		vim \
		git \
		mpv \
		mpc \
		mpd \
		ncmpcpp \
		htop \
		tree \
		ranger \
		neofetch \
		obsidian \
		bitwarden \
		audacity \
		obs-studio \
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
		steam \
		inkscape \
		davinci-resolve \
		blender \
		gamemode

	yay -S --needed \
		aseprite \
		huiontablet \
		pureref \
		proton-ge-custom-bin \
		mpdris2

	sudo rm /etc/xdg/autostart/huiontablet.desktop
fi
