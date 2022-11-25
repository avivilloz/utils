#!/bin/bash

echo -------------------------------------------------------------------------
echo setup mpd
echo -------------------------------------------------------------------------

echo do you want to setup mpd? [y/n]
read ans
if [ $ans  = "y" ]; then
	mkdir -p ~/.config/mpd
	ln -sf ~/git/utils/dotfiles/mpd/mpd.conf ~/.config/mpd/mpd.conf
	systemctl --user enable mpd

	mkdir -p ~/.local/share/applications
	ln -sf ~/git/utils/assets/applications/music_manager.desktop \
		~/.local/share/applications/music_manager.desktop
fi
