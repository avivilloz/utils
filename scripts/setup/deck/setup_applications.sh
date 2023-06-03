#!/bin/bash

echo -------------------------------------------------------------------------
echo setup applications
echo -------------------------------------------------------------------------

sudo pacman -Syy
sudo pacman -S --needed \
	ranger \
	neofetch \
	yakuake \
	google-chrome
	# vim \
	# git \
	# mpc \
	# mpd \
	# ncmpcpp \
	# tree \
	# obsidian \
	# bitwarden \
	# audacity \
	# obs-studio \
	# gimp \
	# godot \
	# flameshot \
	# libreoffice-fresh \
	# virtualbox \
	# virtualbox-host-modules-arch \
	# timeshift \
	# zoom \
	# discord \
	# stacer \
	# visual-studio-code-bin \
	# stremio \
	# solaar \
	# steam \
	# inkscape \
	# davinci-resolve \
	# blender \
	# gamemode

# yay -S --needed \
# 	aseprite \
# 	huiontablet \
# 	pureref \
# 	proton-ge-custom-bin \
# 	mpdris2

# sudo rm /etc/xdg/autostart/huiontablet.desktop