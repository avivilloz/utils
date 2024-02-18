#!/bin/bash

echo -------------------------------------------------------------------------
echo setup applications
echo -------------------------------------------------------------------------

sudo rm -rf /opt/visual-studio-code

yay -Syy
yay -S --needed \
	ranger \
	neofetch \
	yakuake \
	solaar \
	visual-studio-code-bin
	# google-chrome \
	# flameshot \
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
# 	aseprite \
# 	huiontablet \
# 	pureref \
# 	proton-ge-custom-bin \
# 	mpdris2
