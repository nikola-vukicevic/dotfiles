#!/bin/sh
case $BLOCK_BUTTON in
	# 1) dunstify -r 110 "$(date ; echo ; cal)" ;;
	1) shutdown_menu.sh;;
esac

# sat=$(date +"%H:%M")
pwr="⏻"
pwr="▬"
pwr="◉"
pwr="◯"

echo " $pwr "
