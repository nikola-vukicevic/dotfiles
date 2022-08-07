#!/bin/sh
case $BLOCK_BUTTON in
	1) st -e lfrun ;;
esac

ssd_1=$(df -h /dev/nvme0n1p2 | awk '/dev/ {print $4}')
ssd_2=$(df -h /dev/nvme0n1p3 | awk '/dev/ {print $4}')

echo " 💾 $ssd_1/$ssd_2 "
