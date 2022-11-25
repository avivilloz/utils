#!/bin/bash

#if [ "$(mpc playlist)" = "" ]
#then
#    mpc update && mpc ls | mpc add 
#fi

mmstatusfile=~/.mmstatus
mmstatus=$(head -n 1 $mmstatusfile)
if [ "$mmstatus" = "opened" ]; then
    echo "Music Manager is already opened in another window!"
    sleep 0.5
    exit 0
fi

mpDris2 &

echo "opened" > ~/.mmstatus
mpc clear
mpc update && mpc ls | mpc add 
trap 'mpc clear && echo closed > ~/.mmstatus' SIGHUP
trap 'mpc clear && echo closed > ~/.mmstatus' INT
ncmpcpp
mpc clear && echo "closed" > $mmstatusfile
