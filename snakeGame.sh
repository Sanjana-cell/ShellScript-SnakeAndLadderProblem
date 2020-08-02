#!/bin/bash

SNAKE=0
NO_PLAY=1
LADDER=2
START_POSITION=0
WINING_POSITION=100
PLAYER_1_ID=1
PLAYER_2_ID=2

position=0
option=0
currentResult=0
diceNumber=0
numOfTimesDiceRolledP1=0
numOfTimesDiceRolledP2=0
player1Position=0
player2Position=0

echo "Welcome to Snake and Ladder"

#function to change the player 1 and player 2 positions
function changePositions(){
	id=$1
	diceNumber=$2
	option=$3
	case $option in
	$LADDER) if [ $id -eq $PLAYER_1_ID ]
				then
		 				currentResult=$(( player1Position + diceNumber ))
		 				if [ $currentResult -le $WINING_POSITION ]
		 				then
								player1Position=$currentResult
		 				else
								player1Position=$player1Position
		 				fi
				else
						currentResult=$(( player2Position + diceNumber ))
						if [ $currentResult -le $WINING_POSITION ]
						then
									player2Position=$currentResult
						else
									player2Position=$player2Position
						fi
				fi
		 		;;

	$NO_PLAY) if [ $id -eq $PLAYER_1_ID ]
				 then
						player1Position=$player1Position
				 else
						player2Position=$player2Position
				 fi
				 ;;

	$SNAKE)	if [ $id -eq $PLAYER_1_ID ]
				then
						currentResult=$(( player1Position - diceNumber ))
						if [ $currentResult -lt $START_POSITION ]
						then
							player1Position=$START_POSITION
						else
							player1Position=$currentResult
						fi
				else
						currentResult=$(( player2Position - diceNumber ))
						if [ $currentResult -lt 0 ]
						then
								player2Position=$START_POSITION
						else
								player2Position=$currentResult
						fi
				fi
				;;
	esac

	if [ $id -eq $PLAYER_1_ID ]
	then
			echo "Player 1 Current Position " $player1Position
	else
			echo "Player 2 Current Position " $player2Position
	fi
}

#function to play snake and ladder game
function gameStarted(){
	while :
	do
		((numOfTimesDiceRolledP1++))
	 	changePositions $PLAYER_1_ID $(( RANDOM % 6 + 1)) $(( RANDOM % 3 )) #function call for player 1

		# checks if player 1 position or player 2 position is reached winning position 
		if [ $player1Position -eq $WINING_POSITION -o $player2Position -eq $WINING_POSITION ]
		then
				break #breaks the infinite loop if condition is true
		fi

		((numOfTimesDiceRolledP2++))
		changePositions $PLAYER_2_ID $((RANDOM%6+1)) $(( RANDOM % 3 )) #function call for player 2

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
