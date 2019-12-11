#!/bin/bash/ -x

STAKE=100
BETS=1
WIN=1
LOSS=0

echo "Welcome to Gambler Simulation"

Outcome=$((RANDOM%2))
if [ $Outcome -eq $WIN ]
then
	echo " User Win"
else
	echo " User Loss"
fi
