#!/bin/bash

while getopts :d: flag
do
    case "${flag}" in
        d) 
            if [ ${OPTARG} == "ltg" ]
            then
            elif [ ${OPTARG} == "gtl" ]
            then
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
