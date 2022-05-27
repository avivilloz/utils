#!/bin/bash

#if [ "$(mpc playlist)" = "" ]
#then
#    mpc update && mpc ls | mpc add 
#fi

mmstatusfile=~/.mmstatus
mmstatus=$(head -n 1 $mmstatusfile)
if [ "$mmstatus" = "opened" ]; then
    exit 0
fi

echo "opened" > ~/.mmstatus
mpc clear
mpc update && mpc ls | mpc add 
trap 'mpc clear && echo closed > ~/.mmstatus' SIGHUP
trap 'mpc clear && echo closed > ~/.mmstatus' INT
ncmpcpp
mpc clear && echo "closed" > $mmstatusfile
