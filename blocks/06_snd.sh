#!/bin/sh
case $BLOCK_BUTTON in
	1) st -e amx.sh ;;
esac

vol=$(amixer get Master | awk '/Mono:/ { print $4 }' | sed 's/\[//' | sed 's/\]//' )
snd_on=$(amixer get Master | awk '/Mono:/ { print $6 }' )
# 🔇

if [ "$snd_on" = "[on]" ]; then
	echo " 🔈 $vol "
	# dunstctl close-all
	dunstify -r 116 -t 5000 "Volume: $vol"
else
	echo " ^c#ff3377^🔈 [m] ^c#e0e0e0^"
	# dunstctl close-all
	dunstify -u critical -r 116 "Volume: MUTE"
fi
