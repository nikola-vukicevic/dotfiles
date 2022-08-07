#!/bin/sh
case $BLOCK_BUTTON in
	1) dunstify -r 110 "$(date ; echo ; cal)" ;;
esac

# sat=$(date +"%H:%M")
sat=$(date +"%H:%M:%S")

echo " $sat "
