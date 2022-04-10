#!/bin/bash

#$1 is for the section in git (like ds or system_programming)
#$2 is for the project (like stack or sort_list)

if [ $# -ne 2 ]
then
	echo "provide section and project-name"
	exit 1
fi

mkdir ~/git/$1/$2

mkdir ~/git/$1/$2/{src,include,bin,test,lib,obj}

mizi_folder=$mizi/c/project

cp $mizi_folder/makefile  ~/git/$1/$2/

file1_location=~/git/$1/$2/src/$2.c

file2_location=~/git/$1/$2/test/test_$2.c

file3_location=~/git/$1/$2/include/$2.h

cat > $file1_location <<EOF
/*****************************************************************************
Title: $2 - Infinity Labs R&D 
Group: OL91
Author: Aviv
Reviewer: $3
Description: $2 API
******************************************************************************/

#include <stdio.h> /* perror */

#include "$2.h" /* api */

/*****************************************************************************/



/*****************************************************************************/

EOF

cat > $file2_location <<EOF
/*****************************************************************************
Title: $2 - Infinity Labs R&D 
Group: OL91
Author: Aviv
Description: $2 test
******************************************************************************/

#include <stdio.h> /* printf */

#include "$2.h" /* api */

/*****************************************************************************/

typedef enum {TEST_PASS, TEST_FAIL} test_status_t;

/*****************************************************************************/

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

/*************************** TESTS DECLARATIONS ******************************/



/*****************************************************************************/

int main(void)
{


	return 0;
}

/********************************* TESTS *************************************/



/*****************************************************************************/

EOF

cat > $file3_location <<EOF
/*****************************************************************************
Title: $2 - Infinity Labs R&D 
Group: OL91
Description: $2 API
******************************************************************************/

#ifndef _ILRD_OL91__
#define _ILRD_OL91__

/*****************************************************************************/

#define PERROR_IF_BAD(is_bad, msg, action) \\
    if (1 == is_bad) {perror(msg); action;}

#define MSG_IF_BAD(is_bad, msg, action) \\
    if (1 == is_bad) {puts(msg); action;}

#define CHECK_IF_BAD(is_bad, action) \\
    if (1 == is_bad) {action;}

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
