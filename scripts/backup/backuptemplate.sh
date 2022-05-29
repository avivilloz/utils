#!/bin/bash

while getopts :o: flag
do
    case "${flag}" in
        o) 
            if [ ${OPTARG} == "backup" ]; then
            elif [ ${OPTARG} == "retrive" ]; then
            elif [ ${OPTARG} == "clear" ]; then
            else
                echo "invalid argument - options are 'backup', 'retrive' or 'clear'"
            fi
                            ;;
        *)
            echo "invalid flag - options are 'd'"
                            ;;
    esac
done
