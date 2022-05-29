#!/bin/bash

if [ $# -ne 1 ]
then
	echo "provide name of feature you would like to backup!"
	exit 1
fi

. ~/.variables

backuptemplate="$scriptsdir/backup/backuptemplate.sh"
newbackup="$scriptsdir/backup/backup$1.sh"

cp $backuptemplate $newbackup
$edit $newbackup
