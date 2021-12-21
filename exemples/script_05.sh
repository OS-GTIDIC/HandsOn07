#!/bin/bash
mylist=(Winter is comming)
echo ${mylist[0]}
echo ${mylist[1]}
echo ${mylist[2]}
mylist[10]=run
echo ${mylist[10]}
echo ${mylist[*]}         # All of the items in the array
echo ${!mylist[*]}        # All of the indexes in the array
echo ${#mylist[*]}        # Number of items in the array
echo ${#mylist[0]}        # Length of item zero
