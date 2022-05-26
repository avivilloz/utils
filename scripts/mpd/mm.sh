#!/bin/bash

if [ "$(mpc playlist)" = "" ]
then
    mpc update && mpc ls | mpc add 
fi
ncmpcpp
