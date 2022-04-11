#!/bin/bash

if [ $# -ne 3 ]
then
	echo "3 arguments not provided"
	exit 1
fi

file_location=~/git/$1/$2/$3.txt

cat > $file_location <<EOF
-------------------------------------------------------------------------------

$3

-------------------------------------------------------------------------------



-------------------------------------------------------------------------------
EOF



exit 0