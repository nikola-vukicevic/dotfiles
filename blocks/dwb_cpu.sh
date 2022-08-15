#!/bin/sh
case $BLOCK_BUTTON in
	1) st -e htop ;;
esac

# cpu=$(top -n 1 | awk '/Cpu/ {printf("%s%%", $2)}')
cpu=$(mpstat | awk '/all/ { printf("%s%%", $3) }')
# cpu_t=$(awk 'NR==1 {printf("+%s.0C\n", substr($1, 0, 2))}' /sys/class/thermal/thermal_zone*/temp)
cpu_t=$(awk '{printf("+%s.0°C\n", substr($1, 0, 2))}' /sys/class/thermal/thermal_zone0/temp)

echo " CPU: ${cpu} ${cpu_t} "
