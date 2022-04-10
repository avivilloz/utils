#!/bin/bash

if [ $# -ne 2 ]
then
	echo "provide:
1-target-dir
2-project-name"
	exit 1
fi

cpp_files_dir="$mizi/cpp/files"
project_dir="$1/$2"

mkdir $project_dir
mkdir $project_dir/src
mkdir $project_dir/obj
mkdir $project_dir/include
mkdir $project_dir/bin
mkdir $project_dir/lib
mkdir $project_dir/test

cp $cpp_files_dir/hdr.hpp $project_dir/include/$2.hpp
cp $cpp_files_dir/src.cpp $project_dir/src/$2.cpp
cp $cpp_files_dir/test.cpp $project_dir/test/test_$2.cpp
cp $cpp_files_dir/makefile $project_dir/

exit 0 
