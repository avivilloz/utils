#!/bin/bash

echo -------------------------------------------------------------------------
echo setup kde
echo -------------------------------------------------------------------------

echo do you want to do a complete install of kde on arch -needs yay installed- ? [y/n]
read ans
if [ $ans  = "y" ]; then
    sudo pacman -S sddm plasma kdeconnect ark dolphin konsole gwenview okular spectacle yakuake packagekit-qt5 --needed
    yay -S kwin-bismuth --needed

	sudo systemctl enable sddm
fi

echo do you want to config kde? [y/n]
read ans
if [ $ans  = "y" ]; then
    #config
	kdeconfigfilespath=~/git/utils/dotfiles/config/kde
    configfilespath=~/.config
	cd $kdeconfigfilespath
	for file in *;
	do
        rm -rf $configfilespath/$file
		ln -sf $kdeconfigfilespath/$file $configfilespath/$file
	done

    #share
	kdesharefilespath=~/git/utils/resources/share/kde
    sharefilespath=~/.local/share
	cd $kdesharefilespath
	for file in *;
	do
        rm -rf $sharefilespath/$file
		ln -sf $kdesharefilespath/$file $sharefilespath/$file
	done

	#fonts
	gitfontspath=~/git/utils/resources/fonts
    localfontspath=~/.fonts
	rm -rf $localfontspath
	ln -sf $gitfontspath $localfontspath
fi
