keyb=$(setxkbmap -query | awk '/layout/{ print $2 }')
keyb_var=$(setxkbmap -query | awk '/variant/{ print $2 }')

if [ "$keyb" = "rs" ]; then
	if [ "$keyb_var" = "latin" ]; then
		keyb="rs (l)"
	else
		keyb="rs (c)"
	fi
fi

echo " ⌨ $keyb "
