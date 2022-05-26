#!/bin/bash

. ~/.variables

script=""
if [ -z $2 ]; then
    script=$scriptsdir/$1.sh
else
    script=$scriptsdir/$1/$2.sh
fi

$edit $edit_flags $script
