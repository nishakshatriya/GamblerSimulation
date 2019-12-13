#!/bin/bash/ -x

echo "Welcome to Gambler Simulation.."

#CONSTANT
STAKE=100
BET=1
PERCENT=$(( $STAKE*50/100 ))
WIN_LIMIT=$(( $STAKE+$PERCENT ))
LOSS_LIMIT=$(( $STAKE-$PERCENT ))


declare -A diffAmountDict
declare -A totalAmountDict

function gambling()
{

	for((day=0; day<20; day++))
	do
		cash=$STAKE
		while [[ $cash -lt $WIN_LIMIT ]] && [[ $cash -gt $LOSS_LIMIT ]]
			do
				Outcome=$((RANDOM%2))
				if [ $Outcome -eq 1 ]
				then
					cash=$(($cash+$BET))
				else
					cash=$(($cash-$BET))
				fi
			done

		amount=$(( $cash-$STAKE ))
		totalAmount=$(($totalAmount+$amount))
		totalAmountDict[$day]=$totalAmount
		diffAmountDict[$day]=" "$totalAmount

	done

	echo "total amount:" $totalAmount

	for((day=0; day<20; day++))
	do
		echo  "Day$day" ${diffAmountDict[$day]}
	done

}

function getLuckyUnluckyDay()
{
	for((day=0; day<20; day++))
	do
		echo "Day$day" ${totalAmountDict[$day]}
	done | sort -k2 -nr | awk 'NR==1 {print($1 "Luckiest Day " $2)} AND awk NR==20 {print($1 "UnLuckiest" $2)}'
}

function checkNextPlay()
{

if [ $totalAmount -gt 0 ]
then
		performingOperations
else
	echo "Shortage of Money"
fi

}

function performingOperations()
{
	gambling
	getLuckyUnluckyDay
	checkNextPlay
}
performingOperations
