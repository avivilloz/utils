#!/bin/bash

while getopts :d: flag
do
    case "${flag}" in
        d) 
            if [ ${OPTARG} == "backup" ]; then
                cp -rf \
                    ~/git/utils/dotfiles/df
                    ~/git/utils/backup/dotfiles/
            elif [ ${OPTARG} == "retrive" ]; then
                cp -rf \
                    ~/git/utils/backup/dotfiles/df
                    ~/git/utils/dotfiles/
            else
                echo "invalid argument - options are 'backup' or 'retrive'"
            fi
                            ;;
        *)
            echo "invalid flag - options are 'd'"
                            ;;
    esac
done
