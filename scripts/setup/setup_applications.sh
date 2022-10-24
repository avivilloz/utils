#!/bin/bash

echo -------------------------------------------------------------------------
echo setup applications
echo -------------------------------------------------------------------------

echo do you want to install applications on arch? [y/n]
read ans
if [ $ans  = "y" ]; then
	sudo pacman -S vim --needed
	sudo pacman -S git --needed
	sudo pacman -S mpc mpd ncmpcpp --needed
	sudo systemctl enable --now mpd
	yay -S mpdris2 --needed
	sudo pacman -S neofetch --needed
	sudo pacman -S obsidian --needed
	sudo pacman -S bitwarden --needed
	sudo pacman -S blender --needed
	sudo pacman -S audacity --needed
	sudo pacman -S discord --needed
	sudo pacman -S flameshot --needed
	sudo pacman -S balena-etcher --needed
	sudo pacman -S github-desktop --needed
	sudo pacman -S firefox-appmenu --needed
	sudo pacman -S gimp --needed
	sudo pacman -S gnucash --needed
	sudo pacman -S godot --needed
	sudo pacman -S htop --needed
	sudo pacman -S inkscape --needed
	sudo pacman -S libreoffice-fresh --needed
	sudo pacman -S mpv --needed
	sudo pacman -S vlc --needed
	sudo pacman -S obs-studio --needed
	sudo pacman -S virtualbox virtualbox-host-modules-arch --needed
	sudo pacman -S qalculate-qt --needed
	sudo pacman -S ranger --needed
	sudo pacman -S timeshift --needed
	sudo pacman -S telegram-qt --needed
	sudo pacman -S stacer --needed
	sudo pacman -S kdenlive --needed
	sudo pacman -S krita --needed
	sudo pacman -S kcharselect --needed
	sudo pacman -S kcolorchooser --needed
	sudo pacman -S ktorrent --needed
	sudo pacman -S sweeper --needed
	sudo pacman -S steam --needed
	sudo pacman -S visual-studio-code-bin --needed
	sudo pacman -S wireshark-qt --needed
	sudo pacman -S zoom --needed
	sudo pacman -S stremio --needed
	sudo pacman -S akregator --needed
	yay -S aseprite --needed
	yay -S google-chrome --needed
	yay -S huiontablet --needed
fi
