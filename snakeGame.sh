#!/bin/bash -x

SNAKE=0
NO_PLAY=1
LADDER=2
START_POSITION=0

position=0
option=0

echo "Welcome to Snake and Ladder"
dice_number=$(($RANDOM%6+1))
echo "Player got " $dice_number "by rolling the dice" 
option=$(($RANDOM%3))
case $option in
	$LADDER)	position=$(($position + $dice_number));;
	$NO_PLAY)position=$position;;
	$SNAKE)	position=$(($position - $dice_number));;
esac

if [ $position -lt 0 ]
then
		position=$START_POSITION
fi

echo "Player postion " $position 
