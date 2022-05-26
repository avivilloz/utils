#!/bin/bash

. ~/.variables

synctemplate=$scriptsdir/sync/synctemplate.sh
newsync=$scriptsdir/sync/sync$1.sh

cp $synctemplate $newsync

$edit $newsync
