#!/bin/bash

if [ $# -ne 1 ]
then
	echo "provide name of feature you would like to sync!"
	exit 1
fi

. ~/.variables

synctempl="$scriptsdir/sync/synctempl.sh"
newsync="$scriptsdir/sync/sync$1.sh"

cp $synctempl $newsync
$edit $newsync
