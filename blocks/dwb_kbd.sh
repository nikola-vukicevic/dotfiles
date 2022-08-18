keyb=($(setxkbmap -query | awk '/layout/ { print $2 }; /variant/ { print $2 }'))

if [ "${keyb[0]}" = "rs" ]; then
	if [ "${keyb[1]}" = "latin" ]; then
		keyb="rs (l)"
	else
		keyb="rs (c)"
	fi
fi

echo " ⌨ $keyb "
