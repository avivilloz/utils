#!/bin/bash

while getopts :d: flag
do
    case "${flag}" in
        d) 
            if [ ${OPTARG} == "ltg" ]
            then
                cp \
                    ~/.config/alacritty/alacritty.yml \
                    ~/git/utils/dotfiles/.config/alacritty/
            elif [ ${OPTARG} == "gtl" ]
            then
                cp \
                    ~/git/utils/dotfiles/.config/alacritty/alacritty.yml \
                    ~/.config/alacritty/
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
