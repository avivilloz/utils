#!/bin/bash

echo -------------------------------------------------------------------------
echo setup git
echo -------------------------------------------------------------------------

echo do you want to setup git? [y/n]
read ans
if [ $ans  = "y" ]; then
    . ~/.variables
    git config --global user.email $git_user_email
    git config --global user.name $git_user_name
fi

exit 0
