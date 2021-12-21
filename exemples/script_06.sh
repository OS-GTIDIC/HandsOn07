#!/bin/bash
current_dir=`pwd`
echo $current_dir
echo "Current dir is $(pwd)"
touch `cat file_names`
dir_list=`ls -l`
echo $dir_list              # Removes trailing newlines
echo "$dir_list"
