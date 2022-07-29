#!/bin/bash

if [ $# -ne 1 ]
then
	echo "provide name of feature you would like to setup!"
	exit 1
fi

. ~/.variables

setup_all=$scriptsdir/setup/setup_all.sh
newsetup="$scriptsdir/setup/setup_$1.sh"
setuptemplate="$scriptsdir/setup/setup_template.sh"

echo "bash ~/git/utils/scripts/setup/setup_$1.sh" >> $setup_all
cp $setuptemplate $newsetup
$edit $newsetup
