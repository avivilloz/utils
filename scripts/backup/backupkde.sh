#!/bin/bash

while getopts :d: flag
do
    case "${flag}" in
        d) 
            if [ ${OPTARG} == "backup" ]
            then
                cp -rf \
                    ~/git/utils/dotfiles/config/kde \
                    ~/git/utils/backup/dotfiles/config/

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

            elif [ ${OPTARG} == "retrive" ]
            then
                cp -rf \
                    ~/git/utils/backup/dotfiles/config/kde \
                    ~/git/utils/dotfiles/config/

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

            else
                echo "invalid argument - options are 'backup' or 'retrive'"
            fi
                            ;;
        *)
            echo "invalid flag - options are 'd'"
                            ;;
    esac
done
