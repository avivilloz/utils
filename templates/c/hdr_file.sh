#!/bin/bash

if [ $# -ne 3 ]
then
	echo "3 arguments not provided"
	exit 1
fi

file_location=~/git/$1/$2/include/$3.h

cat > $file_location <<EOF
/*****************************************************************************
Title: $2 - Infinity Labs R&D 
Group: OL91
Author: Aviv
Reviewer:
Description: $2
******************************************************************************/

#ifndef _ILRD_OL91__
#define _ILRD_OL91__

/*****************************************************************************/
/*
Decription:	
Input:
Output:
Error:
Time complexity:
*/



/*****************************************************************************/

#endif /*_ILRD_OL91__*/

EOF



exit 0
