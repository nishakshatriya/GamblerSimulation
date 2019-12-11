#!/bin/bash/ -x

#CONSTANT
STAKE=100
BETS=1


#VARIABLE
Cash=$STAKE
percent=$(($STAKE*50/100))


winLimit=$(( $Cash+$percent ))
lossLimit=$(( $Cash-$percent ))

echo "Welcome to Gambler Simulation"

function gamble()
{

Outcome=$((RANDOM%2))
if [ $Outcome -eq 1 ]
then
	Cash=$(($Cash+1))
else
	Cash=$(($Cash-1))
fi

}

function resign()
{
gamble
while [[ $Cash -lt $winLimit ]] && [[ $Cash -lt $lossLimit ]]
do
	echo $Cash
done
}
 resign
