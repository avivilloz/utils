#!/bin/bash

echo -------------------------------------------------------------------------
echo make bash default
echo -------------------------------------------------------------------------

echo do you want to change terminal to bash? [y/n]
read ans
if [ $ans  = "y" ]; then
    chsh -s /bin/bash
fi