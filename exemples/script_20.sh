#!/bin/bash
function sayMyName {
  echo $1
  shift
  echo $1
}
sayMyName "My name is" "Heisenberg"
exit 0
