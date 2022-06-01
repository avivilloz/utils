#!/bin/bash

echo -------------------------------------------------------------------------
echo setup kde
echo -------------------------------------------------------------------------

echo do you want to do a complete install of kde on arch - includes fonts installation, and needs yay installed? [y/n]
read ans
if [ $ans  = "y" ]; then
    sudo pacman -S plasma sddm kdeconnect ark dolphin konsole gwenview okular spectacle kcolorchooser packagekit-qt5 yakuake --needed
    yay -S nerd-fonts-complete kwin-bismuth kclock --needed
fi

echo do you want to config kde? [y/n]
read ans
if [ $ans  = "y" ]; then
    #config
    rm -rf ~/config/kcminputrc
    ln -sf ~/git/utils/dotfiles/config/kde/kcminputrc ~/.config/kcminputrc
    rm -rf ~/config/ksmserverrc
    ln -sf ~/git/utils/dotfiles/config/kde/ksmserverrc ~/.config/ksmserverrc
    rm -rf ~/config/kdeglobals
    ln -sf ~/git/utils/dotfiles/config/kde/kdeglobals ~/.config/kdeglobals
    rm -rf ~/config/kglobalshortcutsrc
    ln -sf ~/git/utils/dotfiles/config/kde/kglobalshortcutsrc ~/.config/kglobalshortcutsrc
    rm -rf ~/config/kscreenlockerrc
    ln -sf ~/git/utils/dotfiles/config/kde/kscreenlockerrc ~/.config/kscreenlockerrc
    rm -rf ~/config/krunnerrc
    ln -sf ~/git/utils/dotfiles/config/kde/krunnerrc ~/.config/krunnerrc
    rm -rf ~/config/kwinrc
    ln -sf ~/git/utils/dotfiles/config/kde/kwinrc ~/.config/kwinrc
    rm -rf ~/config/kwinrulesrc
    ln -sf ~/git/utils/dotfiles/config/kde/kwinrulesrc ~/.config/kwinrulesrc
    rm -rf ~/config/plasma-org.kde.plasma.desktop-appletsrc
    ln -sf ~/git/utils/dotfiles/config/kde/plasma-org.kde.plasma.desktop-appletsrc ~/.config/plasma-org.kde.plasma.desktop-appletsrc
    rm -rf ~/config/plasmashellrc
    ln -sf ~/git/utils/dotfiles/config/kde/plasmashellrc ~/.config/plasmashellrc
    rm -rf ~/config/plasmarc
    ln -sf ~/git/utils/dotfiles/config/kde/plasmarc ~/.config/plasmarc
    rm -rf ~/config/dolphinrc
    ln -sf ~/git/utils/dotfiles/config/kde/dolphinrc ~/.config/dolphinrc
    rm -rf ~/config/kdeconnect
    ln -sf ~/git/utils/dotfiles/config/kde/kdeconnect ~/.config/kdeconnect
    rm -rf ~/config/konsolerc
    ln -sf ~/git/utils/dotfiles/config/kde/konsolerc ~/.config/konsolerc

    #share
    rm -rf ~/.local/share/konsole
    ln -sf ~/git/utils/resources/share/konsole/ ~/.local/share/konsole
    rm -rf ~/.local/share/color-schemes
    ln -sf ~/git/utils/resources/share/color-schemes/ ~/.local/share/color-schemes
    rm -rf ~/.local/share/icons
    ln -sf ~/git/utils/resources/share/icons/ ~/.local/share/icons
    rm -rf ~/.local/share/wallpapers
    ln -sf ~/git/utils/resources/share/wallpapers/ ~/.local/share/wallpapers
    rm -rf ~/.local/share/plasma
    ln -sf ~/git/utils/resources/share/plasma/ ~/.local/share/plasma
fi
