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
                    ~/git/utils/resources/color-schemes \
                    ~/git/utils/backup/resources/

                cp -rf \
                    ~/git/utils/resources/icons \
                    ~/git/utils/backup/resources/

                cp -rf \
                    ~/git/utils/resources/wallpapers \
                    ~/git/utils/backup/resources/

                cp -rf \
                    ~/git/utils/resources/plasma \
                    ~/git/utils/backup/resources/

            elif [ ${OPTARG} == "retrive" ]; then
                mkdir -p ~/git/utils/dotfiles/config

                cp -rf \
                    ~/git/utils/backup/dotfiles/config/kde \
                    ~/git/utils/dotfiles/config/

                mkdir -p ~/git/utils/resources

                cp -rf \
                    ~/git/utils/backup/resources/color-schemes \
                    ~/git/utils/resources/

                cp -rf \
                    ~/git/utils/backup/resources/icons \
                    ~/git/utils/resources/

                cp -rf \
                    ~/git/utils/backup/resources/wallpapers \
                    ~/git/utils/resources/

                cp -rf \
                    ~/git/utils/backup/resources/plasma \
                    ~/git/utils/resources/

            elif [ ${OPTARG} == "clear" ]; then
                    rm -rf ~/git/utils/backup/dotfiles/config/kde
                    rm -rf ~/git/utils/backup/resources/color-schemes
                    rm -rf ~/git/utils/backup/resources/icons
                    rm -rf ~/git/utils/backup/resources/wallpapers
                    rm -rf ~/git/utils/backup/resources/plasma

            else
                echo "invalid argument - options are 'backup', 'retrive' or 'clear'"
            fi
                            ;;
        *)
            echo "invalid flag - options are 'd'"
                            ;;
    esac
done
