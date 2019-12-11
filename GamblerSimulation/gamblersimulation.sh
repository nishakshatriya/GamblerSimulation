#!/bin/bash/ -x

#CONSTANT
STAKE=100
BETS=1


#VARIABLE
win=0
loss=0
percent=$(( $STAKE*50/100 ))
Cash=$STAKE

declare -A diffArr
declare -A totalArr

winLimit=$(( $Cash+$percent ))
lossLimit=$(( $Cash-$percent ))

echo "Welcome to Gambler Simulation"

function gamble()
{

for((day=0; day<20; day++))
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
echo $amount
totalAmount=$(($totalAmount+$amount))
totalArr[$day]=$totalAmount
diffArr[$day]=$amount" "$totalAmount

done

echo "total amount:" $totalAmount

for((day=0; day<20; day++))
do
	echo  "Day$day" ${diffArr[$day]}
done

}
gamble

function Luckiest()
{

for((day=0; day<20; day++))
do
	echo "Day$day" ${totalArr[$day]}
done | sort -k2 -nr | awk 'NR==1 {print($1 " "$2)}'
}
Luckiest


function UnLuckiest()
{

for((day=0; day<20; day++))
do
        echo "Day$day" ${totalArr[$day]}
done | sort -k2 -n | awk 'NR==1 {print($1 " "$2)}'
}
UnLuckiest

