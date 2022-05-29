#!/bin/bash

while getopts :d: flag
do
    case "${flag}" in
        d) 
            if [ ${OPTARG} == "backup" ]
            then
            elif [ ${OPTARG} == "retrive" ]
            then
            else
                echo "invalid argument - options are 'backup' or 'retrive'"
            fi
                            ;;
        *)
            echo "invalid flag - options are 'd'"
                            ;;
    esac
done
