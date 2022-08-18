#!/bin/sh
case $BLOCK_BUTTON in
	1) st -e amx.sh ;;
esac

data=($(amixer get Master | awk 'END { gsub(/[\]\[]/, "", $0); printf("%s %s", $4, $6); } ' ))
vol=${data[0]}
snd_on=${data[1]}

if [ "$snd_on" = "on" ]; then
	echo " 🔈 $vol "
	dunstify -r 116 -t 5000 "Volume: $vol"
else
	echo " ^c#ff3377^🔈 [m] ^c#e0e0e0^"
	dunstify -u critical -r 116 "Volume: MUTE"
fi
