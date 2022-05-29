#!/bin/bash

while getopts :o: flag
do
    case "${flag}" in
        o) 
            if [ ${OPTARG} == "backup" ]; then
                cp -rf \
                    ~/git/utils/dotfiles/df
                    ~/git/utils/backup/dotfiles/
            elif [ ${OPTARG} == "retrive" ]; then
                cp -rf \
                    ~/git/utils/backup/dotfiles/df
                    ~/git/utils/dotfiles/
            elif [ ${OPTARG} == "clear" ]; then
                    rm -rf ~/git/utils/backup/dotfiles/df
            else
                echo "invalid argument - options are 'backup', 'retrive' or 'clear'"
            fi
                            ;;
        *)
            echo "invalid flag - options are 'd'"
                            ;;
    esac
done
