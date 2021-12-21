#!/bin/bash
let "a=20" "b=3"
let c=a+b
echo $c
let a++
let a=a+5
echo $a
