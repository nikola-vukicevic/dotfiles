#!/bin/sh

poruka=$(sudo pacman -Qu)

if [ "$poruka" != "" ]; then
	broj_paketa=$( echo "$poruka" | wc -l )
	echo " ^c#2277ff^📦 ^c#e0e0e0^($broj_paketa) "
	# notify-send "pacman" "$poruka"
else
	echo ""
	poruka="Nema novih paketa"
fi

case $BLOCK_BUTTON in
	1) notify-send "pacman" "$poruka" ;;
esac

# ---------------------------------------------------------------------------- #

# # poruka="Packages (3) bash-5.00.1 zsh-4.3.00 fish-1.2.300"
# poruka=$(sudo pacman -Syyu | grep 'Packages')
#
# if [ "$poruka" != "" ]; then
#     broj_paketa=$( echo $poruka | awk '{ print $2 }' )
#     poruka=$( echo $poruka | awk '{ for(i=3;i<=NF;i++) print $i }' )
#     echo " ^c#2277ff^📦 ^c#e0e0e0^$broj_paketa "
# else
#     echo ""
#     poruka="Nema novih paketa"
# fi

