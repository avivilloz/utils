#!/bin/bash

sudo dnf install -y \
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
	audacity \
	obs-studio \
	gimp \
	godot \
	flameshot \
	timeshift \
	discord \
	stacer \
	google-chrome-stable \
	solaar \
	inkscape \
	blender \
	steam \
	steam-devices \
	lutris \
	gamemode \
	mangohud \
	protontricks \
	antimicrox

flatpak install \
	us.zoom.Zoom \
	md.obsidian.Obsidian \
	com.bitwarden.desktop \
	com.stremio.Stremio \
	com.visualstudio.code \
	net.davidotek.pupgui2

#	davinci-resolve \
#	aseprite \
#	pureref

. ~/.session_variables

if [ "$desktop_environment" = "gnome" ]; then

	sudo dnf install -y \
		transmission \
		gnome-tweaks

	flatpak install \
		com.mattjakeman.ExtensionManager \
		com.rafaelmardojai.Blanket

	sudo dnf remove -y \
		totem \
		gnome-photos \
		cheese

elif [ "$desktop_environment" = "kde" ]; then

	sudo dnf install -y \
		ktorrent

fi
