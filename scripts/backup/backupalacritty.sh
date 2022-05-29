#!/bin/bash

while getopts :d: flag
do
    case "${flag}" in
        d) 
            if [ ${OPTARG} == "backup" ]
            then
                cp -rf \
                    ~/git/utils/dotfiles/config/alacritty
                    ~/git/utils/backup/dotfiles/config/
            elif [ ${OPTARG} == "retrive" ]
            then
                cp -rf \
                    ~/git/utils/backup/dotfiles/config/alacritty
                    ~/git/utils/dotfiles/config/
            else
                echo "invalid argument - options are 'backup' or 'retrive'"
            fi
                            ;;
        *)
            echo "invalid flag - options are 'd'"
                            ;;
    esac
done
