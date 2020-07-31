#!/bin/bash -
echo "Welcome to Snake and Ladder"
postion=0
dice_number=$(($RANDOM%6+1))
echo "Player got " $dice_number "by rolling the dice" 
