#!/bin/bash

NUM1=10
NUM2=linux


SUM=$(($NUM1+NUM2))

echo "sum is: $SUM"



#array

MOVIES=("RRR" "Pushpa" "kalki")
echo "Movies are: ${MOVIES[@]}"
echo "Movies are: ${MOVIES[1]}"
echo "Movies are: ${MOVIES[2}"