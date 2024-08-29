#!/bin/bash

# Index starts from 0 means counting starts from 0
# Eg. 0 1 2 3 4 5

STUDENTS=("amarnath" "vamshi" "venky" "paramesh" "pawan")

echo "first student  is: $STUDENTS[0]"
echo "second student is: $STUDENTS[1]"
echo "third student  is: $STUDENTS[2]"
echo "fourth student is: $STUDENTS[3]"
echo "fifth students is: $STUDENTS[4]"

echo "available students in the list is : $STUDENTS[@]"