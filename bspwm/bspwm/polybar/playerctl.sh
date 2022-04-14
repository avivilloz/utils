#!/bin/bash

url=$(playerctl metadata xesam:url 2>/dev/null)
url=${url##file:/*/}
url=${url%%.mp3}
title=$(playerctl metadata xesam:title 2>/dev/null)
artist=$(playerctl metadata xesam:artist 2>/dev/null)

if [ "$(playerctl status)" = "Playing"  ]; then
    if [ "$title" = "" ] || [ "$artist" = "" ]; then
        echo " $url"
    else
        echo " $title | $artist"
    fi
elif [ "$(playerctl status)" = "Paused"  ]; then
    if [ "$title" = "" ] || [ "$artist" = "" ]; then
        echo " $url"
    else
        echo " $title | $artist"
    fi
else
    echo ""
fi
