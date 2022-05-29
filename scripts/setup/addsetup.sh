#!/bin/bash

if [ $# -ne 1 ]
then
	echo "provide name of feature you would like to setup!"
	exit 1
fi

. ~/.variables

setuptemplate="$scriptsdir/setup/setuptemplate.sh"
newsetup="$scriptsdir/setup/setup$1.sh"

echo "bash $newsetup" >> $scriptsdir/setup/setup.sh
cp $setuptemplate $newsetup
$edit $newsetup
