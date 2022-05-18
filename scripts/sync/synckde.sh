#!/bin/bash

while getopts :d: flag
do
    case "${flag}" in
        d) 
            if [ ${OPTARG} == "ltg" ]
            then
                cp -rf \
                    ~/.config/kcminputrc \
                    ~/.config/ksmserverrc \
                    ~/.config/kdeglobals \
                    ~/.config/kglobalshortcutsrc \
                    ~/.config/kscreenlockerrc \
                    ~/.config/krunnerrc \
                    ~/.config/kwinrc \
                    ~/.config/kwinrulesrc \
                    ~/.config/latte \
                    ~/.config/lattedockrc \
                    ~/.config/plasma-org.kde.plasma.desktop-appletsrc \
                    ~/.config/plasmashellrc \
                    ~/.config/plasmarc \
                    ~/.config/dolphinrc \
                    ~/git/utils/dotfiles/.config/kde/

                cp -rf \
                    ~/.local/share/color-schemes/* \
                    ~/git/utils/resources/color-schemes/

                cp -rf \
                    ~/.local/share/icons/* \
                    ~/git/utils/resources/icons/

                cp -rf \
                    ~/.local/share/wallpapers/* \
                    ~/git/utils/resources/wallpapers/

                cp -rf \
                    ~/.local/share/plasma/* \
                    ~/git/utils/resources/plasma/
            elif [ ${OPTARG} == "gtl" ]
            then
                cp -rf \
                    ~/git/utils/dotfiles/.config/kde/* \
                    ~/.config/

                cp -rf \
                    ~/git/utils/resources/color-schemes/* \
                    ~/.local/share/color-schemes/

                cp -rf \
                    ~/git/utils/resources/icons/* \
                    ~/.local/share/icons/

                cp -rf \
                    ~/git/utils/resources/wallpapers/* \
                    ~/.local/share/wallpapers/

                cp -rf \
                    ~/git/utils/resources/plasma/* \
                    ~/.local/share/plasma/
            else
                echo "invalid argument"
            fi
                            ;;
        *)
            echo "invalid flag"
                            ;;
    esac
done

exit 0
