#!/bin/bash 

SNAKE=0
NO_PLAY=1
LADDER=2
START_POSITION=0
WINING_POSITION=100

numOfTimesDiceRolledP1=0
numOfTimesDiceRolledP2=0
player1Position=0
player2Position=0

echo "Welcome to Snake and Ladder"

#function to change the player 1 and player 2 positions
function changePositions(){
	local diceNumber=$1
	local option=$2
	local position=$3
	local currentResult=0

	case $option in
	$LADDER) currentResult=$(( position + diceNumber ))
		 if [ $currentResult -le $WINING_POSITION ]
		 then
			diceNumber=$(( RANDOM % 6 + 1))
		  	position=$(( position + diceNumber ))
		 fi
		 ;;

	$NO_PLAY) position=$position;;

	$SNAKE)	currentResult=$(( position - diceNumber ))
		if [ $currentResult -lt $START_POSITION ]
		then
			position=$START_POSITION
		else
			position=$currentResult
		fi
		;;

	esac
	echo $position
}

#function to play snake and ladder game
function gameStarted(){
	while :
	do
		((numOfTimesDiceRolledP1++))
	 	player1Position="$(changePositions $(( RANDOM % 6 + 1)) $(( RANDOM % 3 ))  $player1Position )" #function call for player 1

		echo "Current position of player 1" $player1Position
		echo "Current position of player 2" $player2Position

		if [ $player1Position -eq $WINING_POSITION -o $player2Position -eq $WINING_POSITION ]
		then
				break #breaks the infinite loop if condition is true
		fi

		((numOfTimesDiceRolledP2++))
		player2Position="$(changePositions  $((RANDOM % 6 + 1)) $(( RANDOM % 3 )) $player2Position )" #function call for player 2
	done
}

gameStarted

if [  $player1Position -eq $WINING_POSITION ]
then
	echo "--------------------------------"
	echo "CONGRAGULATIONS !! PLAYER 1 HAS WON THE GAME" 
	echo "YOU HAVE REACHED" $player1Position "th" "POSITION"
	echo "Dice Rolled " $numOfTimesDiceRolledP1 "times for player 1 to win"
else
	echo "--------------------------------"
	echo "CONGRAGULATIONS !! PLAYER 2 HAS WON THE GAME" 
	echo "YOU HAVE REACHED" $player2Position "th" "POSITION"
	echo "Dice Rolled " $numOfTimesDiceRolledP2 "times for player 2 to win"
fi
