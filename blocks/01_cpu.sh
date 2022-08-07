#!/bin/sh
case $BLOCK_BUTTON in
	1) st -e htop ;;
esac

# cpu=$(top -n 1 | awk '/Cpu/ {printf("%s%%", $2)}')
cpu=$(mpstat | awk '/all/ { printf("%s%%", $3) }')
cpu_t=$(sensors | awk '/Core 0/ {print $3}')

echo " CPU: ${cpu} ${cpu_t} "
