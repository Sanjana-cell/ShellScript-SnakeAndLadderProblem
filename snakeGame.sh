#!/bin/bash 

SNAKE=0
NO_PLAY=1
LADDER=2
START_POSITION=0
WINING_POSITION=100

position=0
option=0
index=0
currentResult=0
diceNumber=0
numOfTimesDiceRolled=0

echo "Welcome to Snake and Ladder"

#function to the change position according to the options
function changePositions(){
	case $option in
	$LADDER) currentResult=$(( position + diceNumber ))
		 if [ $currentResult -le $WINING_POSITION ]
		 then
			position=$currentResult
		 else 
			position=$position
			echo "Current Position =" $currentResult
		 fi
		 ;;

	$NO_PLAY) position=$position;;

	$SNAKE)	currentResult=$(( position - diceNumber ))
		if [ $currentResult -lt 0 ]
		then
			position=$START_POSITION
		else
			position=$currentResult
		fi
		;;
	esac
	echo "Current Position =" $position
}

#function to play snake and ladder game
function game(){
	while [ $position -lt $WINING_POSITION ]
	do
		diceNumber=$(( RANDOM % 6 + 1 )) #generates number from 1 to 6
		((numOfTimesDiceRolled++))
 		option=$(( RANDOM % 3 )) #generates number from 0 to 2
		changePositions #function call
	done
}

game #function call
echo "--------------------------------"
echo "YOU HAVE REACHED" $position "th" "POSITION"
echo "CONGRAGULATIONS !! YOU WON "
echo "Rolled Dice for" $numOfTimesDiceRolled "times to win"
