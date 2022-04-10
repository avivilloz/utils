#!/bin/bash

if [ $# -ne 3 ]
then
	echo "3 arguments not provided"
	exit 1
fi

file_location=~/git/$1/$2/src/$3.c

cat > $file_location <<EOF
/*****************************************************************************
Title: $3 - Infinity Labs R&D 
Group: OL91
Author: Aviv
Reviewer:
Description: $3
******************************************************************************/

#include <stdio.h> /* perror */

#include "$3.h" /* api */

/*****************************************************************************/

#define RETURN_IF_BAD(is_good, error_msg, ret_val) \\
	if (0 == is_good) \\
	{ \\
		perror(error_msg); \\
		return ret_val; \\
	}

static void ExitIfBad(int is_good, int exit_value, const char *error_msg)
{
	if (!is_good)
	{
		perror(error_msg);
		exit(exit_value);
	}
}

/*****************************************************************************/



/*****************************************************************************/

EOF



exit 0
