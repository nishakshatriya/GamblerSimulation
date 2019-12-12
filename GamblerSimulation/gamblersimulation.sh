#!/bin/bash/ -x

echo "Welcome to Gambler Simulation.."

#CONSTANT
STAKE=100
BETS=1

#VARIABLE
win=0
loss=0
cash=$STAKE

declare -A diffDict
declare -A totalDict

percent=$(( $STAKE*50/100 ))
winLimit=$(( $cash+$percent ))
lossLimit=$(( $cash-$percent ))


function gamble()
{

	for((day=0; day<20; day++))
	do
		cash=$STAKE
		while [[ $cash -lt $winLimit ]] && [[ $cash -gt $lossLimit ]]
			do
				Outcome=$((RANDOM%2))
				if [ $Outcome -eq 1 ]
				then
					cash=$(($cash+1))
					win=$(($win+1))
				else
					cash=$(($cash-1))
					loss=$(($loss-1))
				fi
			done

		amount=$(( $cash-$STAKE ))
		totalAmount=$(($totalAmount+$amount))
		totalDict[$day]=$totalAmount
		diffDict[$day]=" "$totalAmount

	done

	echo "total amount:" $totalAmount

	for((day=0; day<20; day++))
	do
		echo  "Day$day" ${diffDict[$day]}
	done

}

function luckiestUnluckiest()
{
	for((day=0; day<20; day++))
	do
		echo "Day$day" ${totalDict[$day]}
	done | sort -k2 -nr | awk 'NR==1 {print($1 "Luckiest Day " $2)} AND awk NR==20 {print($1 "UnLuckiest" $2)}'
}

function nextPlay()
{

profit=$totalAmount
if [ $totalAmount -gt 0 ]
then
		main
else
	echo "Shortage of Money"
fi

}

function main()
{
	gamble
	luckiestUnluckiest
	nextPlay
}
main
