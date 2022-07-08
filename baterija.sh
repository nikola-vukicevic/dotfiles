#!/bin/bash

bat_stat=$(</sys/class/power_supply/BAT0/status)
bat_cap=$(</sys/class/power_supply/BAT0/capacity)

bat_msg_1="-"
bat_msg_2="$bat_cap% "

if [ "$bat_stat" = "Charging" ]; then
	bat_msg_1="C"
elif [ "$bat_stat" = "Full" ]; then
	bat_msg_1="F"
	bat_msg_2=""
elif [ "$bat_stat" = "Not charging" ]; then
	bat_msg_1="N"
else
	if [ $bat_cap -le 25 ]; then
		bat_msg_1="!!!"
	else
		bat_msg_1="D"
	fi
fi
