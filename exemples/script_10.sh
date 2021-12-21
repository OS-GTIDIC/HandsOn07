#!/bin/bash
expr 10 + 2     # returns 12
expr 10+2       # returns 10+2
n=10
n=`expr "$n" + 1`
echo $n
