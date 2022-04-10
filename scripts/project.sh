#!/bin/bash

if [ $# -ne 3 ]
then
	echo "provide:
1-language-src type
2-target-dir
3-project-name"
	exit 1
fi

bash $cfgdir/$1/project.sh $2 $3

exit 0
