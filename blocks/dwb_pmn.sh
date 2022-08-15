#!/bin/sh

# ---------------------------------------------------------------------------- #
poruka=$(sudo pacman -Syyu | grep 'Packages')

if [ "$poruka" != "" ]; then
	broj_paketa=$( echo $poruka | awk '{ print $2 }' )
	poruka=$( echo $poruka | awk '{ for(i=3;i<=NF;i++) print $i }' )
	echo " ^c#2277ff^📦 ^c#e0e0e0^$broj_paketa "
else
	echo ""
	poruka="Nema novih paketa"
fi
# ---------------------------------------------------------------------------- #
case $BLOCK_BUTTON in
	1) notify-send "pacman" "$poruka" ;;
esac

