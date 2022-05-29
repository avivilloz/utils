#!/bin/bash

while getopts :o: flag
do
    case "${flag}" in
        o) 
            if [ ${OPTARG} == "backup" ]; then
                cp -rf \
                    ~/git/utils/dotfiles/config/alacritty
                    ~/git/utils/backup/dotfiles/config/
            elif [ ${OPTARG} == "retrive" ]; then
                cp -rf \
                    ~/git/utils/backup/dotfiles/config/alacritty
                    ~/git/utils/dotfiles/config/
            elif [ ${OPTARG} == "clear" ]; then
                    rm -rf ~/git/utils/backup/dotfiles/config/alacritty
            else
                echo "invalid argument - options are 'backup', 'retrive' or 'clear'"
            fi
                            ;;
        *)
            echo "invalid flag - options are 'd'"
                            ;;
    esac
done
