#!/bin/bash

while getopts :o: flag
do
    case "${flag}" in
        o) 
            if [ ${OPTARG} == "backup" ]; then
                mkdir -p ~/git/utils/backup/dotfiles/config

                cp -rf \
                    ~/git/utils/dotfiles/config/kde \
                    ~/git/utils/backup/dotfiles/config/

                mkdir -p ~/git/utils/backup/resources

                cp -rf \
                    ~/git/utils/resources/share/color-schemes \
                    ~/git/utils/backup/resources/share/

                cp -rf \
                    ~/git/utils/resources/share/icons \
                    ~/git/utils/backup/resources/share/

                cp -rf \
                    ~/git/utils/resources/share/wallpapers \
                    ~/git/utils/backup/resources/share/

                cp -rf \
                    ~/git/utils/resources/share/plasma \
                    ~/git/utils/backup/resources/share/

                cp -rf \
                    ~/git/utils/resources/share/konsole \
                    ~/git/utils/backup/resources/share/

            elif [ ${OPTARG} == "retrive" ]; then
                mkdir -p ~/git/utils/dotfiles/config

                cp -rf \
                    ~/git/utils/backup/dotfiles/config/kde \
                    ~/git/utils/dotfiles/config/

                mkdir -p ~/git/utils/resources

                cp -rf \
                    ~/git/utils/backup/resources/share/color-schemes \
                    ~/git/utils/resources/share/

                cp -rf \
                    ~/git/utils/backup/resources/share/icons \
                    ~/git/utils/resources/share/

                cp -rf \
                    ~/git/utils/backup/resources/share/wallpapers \
                    ~/git/utils/resources/share/

                cp -rf \
                    ~/git/utils/backup/resources/share/plasma \
                    ~/git/utils/resources/share/

                cp -rf \
                    ~/git/utils/backup/resources/share/konsole \
                    ~/git/utils/resources/share/

            elif [ ${OPTARG} == "clear" ]; then
                    rm -rf ~/git/utils/backup/dotfiles/config/kde
                    rm -rf ~/git/utils/backup/resources/share/color-schemes
                    rm -rf ~/git/utils/backup/resources/share/icons
                    rm -rf ~/git/utils/backup/resources/share/wallpapers
                    rm -rf ~/git/utils/backup/resources/share/plasma
                    rm -rf ~/git/utils/backup/resources/share/konsole

            else
                echo "invalid argument - options are 'backup', 'retrive' or 'clear'"
            fi
                            ;;
        *)
            echo "invalid flag - options are 'd'"
                            ;;
    esac
done
