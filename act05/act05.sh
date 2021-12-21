#!/bin/bash
N=$1
sign_decimal_expr='^[-+]?[0-9]+([.][0-9]+)?$'
if ! [[ $N =~ $sign_decimal_expr ]] ; then
    echo "Error: No es un nombre amb signe decimal!" >&2;
    exit 1
fi