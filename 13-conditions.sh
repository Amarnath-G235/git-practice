#!/bin/bash

NUM=$1

if [ $NUM -gt 20 ]
then
   echo "given number $NUM is greater than 20"
else [ $NUM -eq 20 ]
then
   echo "given number $NUM is equal to 20"
else [ $NUM -lt 20 ]
then
   echo "given number $NUM is less than 20"
fi