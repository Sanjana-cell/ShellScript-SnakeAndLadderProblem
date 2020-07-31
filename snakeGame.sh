#!/bin/bash -x

SNAKE=0
NO_PLAY=1
LADDER=2
START_POSITION=0

position=0
option=0

echo "Welcome to Snake and Ladder"
dice_number=$(($RANDOM%6+1)) #generates number from 1 to 6
echo "Player got " $dice_number "by rolling the dice" 
option=$(($RANDOM%3)) #generates number from 0 to 2
#switch case to match the option with any one of the case and change position 
case $option in
	$LADDER)position=$(($position + $dice_number));;
	$NO_PLAY)position=$position;;
	$SNAKE)	position=$(($position - $dice_number));;
esac
#checks if position is minus value if it is minus value then assigns with start position  
if [ $position -lt 0 ]
then
		position=$START_POSITION
fi

echo "Player postion " $position 
