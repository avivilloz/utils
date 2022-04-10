#!/bin/bash

if [ $# -ne 3 ]
then
	echo "3 arguments not provided"
	exit 1
fi

file_location=~/git/$1/$2

cp $mizi/c/project/makefile $file_location
