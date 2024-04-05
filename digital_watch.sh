#!/bin/bash


#COLOR CODES EXPLORE MORE FROM GOOGLE

RED=$'31'
GREEN=$'32'
BOLDGREEN=$'\e[1;${GREEN}m'
ITALICRED=$'\e[3;${RED}m'
ENDCOLOR=$'\e[0m'
BLUE=$'\033[94m'

while [[ true ]]
do
	clear
	echo $BLUE $(date +%T)
	sleep 1s
done

