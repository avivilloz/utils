#!/bin/bash

if [ $# -ne 4 ]; then
	echo "\
provide:
1. username
2. main branch to branch out from
3. new branch purpose or jira ticket id
4. commit id"
	exit 1
fi

git_user=$1
main_branch=$2
new_branch_purpose=$3
commit=$4
should_push=$5

new_branch=$git_user/$new_branch_purpose\_$main_branch

git checkout $main_branch
git pull
git checkout -b $new_branch
git cherry-pick --strategy=recursive -X theirs $commit
git push --set-upstream origin $new_branch

exit 0
