#!/bin/bash

while true
do
	d=$(date +"%H:%M:%S")
	ram=$(free -h | awk /^Mem/'{printf("%sB", $3)}')
	ssd_1=$(df -h /dev/nvme0n1p2 | awk '/dev/ {print $4}')
	ssd_2=$(df -h /dev/nvme0n1p3 | awk '/dev/ {print $4}')
	cpu=$(top -n 1 | awk '/Cpu/ {printf("%s%%", $2)}')
	cpu=$(mpstat | awk '/all/ { printf("%s%%", $3) }')
	cpu_t=$(sensors | awk '/Core 0/ {print $3}')
	
	source ~/.dwm/baterija.sh
	
	keyb=$(setxkbmap -query | awk '/layout/{ print $2 }')
	xsetroot -name " CPU: $cpu $cpu_t | RAM: $ram | 💾 $ssd_1/$ssd_2 | $bat_msg_1 $bat_msg_2| ⌨  $keyb | $d "
#	echo " CPU: $cpu $cpu_t | RAM: $ram | SSD: $ssd_1/$ssd_2 | bat: ($bat_msg_1) $bat_msg_2| ⌨  $keyb | $d "
	sleep 1
done

