#!/bin/bash

if [ $# -ne 1 ]
then
	echo "provide message in between quotation marks"
	exit 1
fi

git add .
git commit -m "$1"
git push
