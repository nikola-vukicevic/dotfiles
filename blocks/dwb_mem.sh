#!/bin/sh
case $BLOCK_BUTTON in
	1) st -e htop ;;
esac

ram=$(free -h | awk '/^Mem/ { printf("%sB", $3) }')

echo " RAM: $ram "
