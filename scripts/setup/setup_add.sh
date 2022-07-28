#!/bin/bash

if [ $# -ne 1 ]
then
	echo "provide name of feature you would like to setup!"
	exit 1
fi

. ~/.variables

setup=$scriptsdir/setup/setup.sh
newsetup="$scriptsdir/setup/setup$1.sh"
setuptemplate="$scriptsdir/setup/setuptemplate.sh"

echo "bash ~/git/utils/scripts/setup/setup$1.sh" >> $setup
cp $setuptemplate $newsetup
$edit $newsetup
