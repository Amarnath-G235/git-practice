#!/bin/bash

echo "please enter your username:"

# read command will take the input from user and
# It will put that input into the variable 'USERNAME'

read USERNAME

echo "entered username is:$USERNAME"

# if you don't want password to be visible while you are entering use 'read-s'
echo "enter password:"
read -s PASSWORD

# below statement is for just for confirmation
echo "entered password is : $PASSWORD"