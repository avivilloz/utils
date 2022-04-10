#!/bin/bash

#$1 is for the section in git (like ds or system_programming)
#$2 is for the project (like stack or sort_list)

if [ $# -ne 2 ]
then
	echo "provide section and project-name"
	exit 1
fi

mkdir ~/git/$1/$2

mkdir ~/git/$1/$2/{src,bin}

mizi_folder=$mizi/c/simple_project

cp $mizi_folder/makefile  ~/git/$1/$2/

file_location=~/git/$1/$2/src/$2.c

cat > $file_location <<EOF
/*****************************************************************************
Title: $2 - Infinity Labs R&D 
Group: OL91
Author: Aviv
Reviewer: $3
Description: $2
******************************************************************************/

#include <stdio.h> /* printf */

/*****************************************************************************/

typedef enum {TEST_PASS, TEST_FAIL} test_status_t;

/*****************************************************************************/

#define PERROR_IF_BAD(is_bad, msg, action) \\
    if (1 == is_bad) {perror(msg); action;}

#define MSG_IF_BAD(is_bad, msg, action) \\
    if (1 == is_bad) {puts(msg); action;}

#define CHECK_IF_BAD(is_bad, action) \\
    if (1 == is_bad) {action;}

#define EXPECT(x) if (!(x)) {return TEST_FAIL;}

static void Test(test_status_t func_test, char *func_name)
{
	if (TEST_FAIL == func_test)
	{
		printf("%s: \33[5;1;31mFAILURE\33[0m\n", func_name);
	}
	else
	{
		printf("%s: \33[5;1;32;1mSUCCESS\33[0m\n", func_name);
	}
}

/************************** FUNCTION DECLARATIONS ****************************/



/*****************************************************************************/

int main(void)
{


	return 0;
}

/******************************* FUNCTIONS ***********************************/



/*****************************************************************************/

EOF

exit 0
