#!/bin/bash

if [ $# -ne 4 ]; then
	echo "\
provide:
- git username
- main branch to branch out from
- new branch purpose or ticket
- commit id"
	exit 1
fi

git_user=$1
main_branch=$2
new_branch_purpose=$3
commit=$4

new_branch=$git_user/$new_branch_purpose\_$main_branch

git checkout $branch
git pull
git checkout -b $new_branch
git cherry-pick $commit
git push --set-upstream origin $new_branch

exit 0
