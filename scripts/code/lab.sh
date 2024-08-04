#!/bin/bash

if [ $# -ne 2 ]
then
	echo "provide language-src type and file-name"
	exit 1
fi

cp $utilsdir/templates/$1/files/lab.$1 ./$2.$1

#vim $2.$1

exit 0
