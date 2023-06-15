#!/bin/bash

if [ $# -ne 1 ]
then
	echo "provide commit message in between quotation marks"
	exit 1
fi

git add -u
git commit --allow-empty -m "$1"
git push
