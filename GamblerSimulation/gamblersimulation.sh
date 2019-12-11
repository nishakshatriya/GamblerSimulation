#!/bin/bash/ -x

#CONSTANT
STAKE=100
BETS=1
Cash=$STAKE

#VARIABLE
win=0
loss=0
percent=$(( $STAKE*50/100 ))


winLimit=$(( $Cash+$percent ))
lossLimit=$(( $Cash-$percent ))

echo "Welcome to Gambler Simulation"

function gamble()
{

for((day=1; day<20; day++))
do
	Cash=$STAKE

	while [[ $Cash -lt $winLimit ]] && [[ $Cash -gt $lossLimit ]]
	do
		Outcome=$((RANDOM%2))
		if [ $Outcome -eq 1 ]
		then
			Cash=$(($Cash+1))
			win=$(($win+1))
		else
			Cash=$(($Cash-1))
			loss=$(($loss-1))
		fi
	done
amount=$(( $Cash-$STAKE ))
totalAmount=$(($totalAmount+$amount))
done
echo "total amount:" $totalAmount


}
gamble

