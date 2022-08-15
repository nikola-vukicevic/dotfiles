#!/bin/bash

# ⚠️  🔋 🔌 ⚡ ° 💾 📂 ∣ │ ╎ ╏ ╵ ╷ ▕ ▯ ▮ ⁝⁞∣ ≡ ⋮ 📡 📶 🌐⏻ ⁕ ⁜ ↲ ∏

wifi_prev=$(</home/korisnik/.dwm/blocks/wifi_prev)
wifi=$(awk '/wlan0/ { printf("%d", $3) }' /proc/net/wireless )
wifi_snaga="-"
# wifi_ikona="📡"
wifi_ikona="📶"
# --------------------------------------------------------------------------- #
[ "$wifi_prev" = "" ] && [ "$wifi" != "" ] && dunstify -r 104 "Wi-fi uključen"
[ "$wifi_prev" != "" ] && [ "$wifi" = "" ] && dunstify -r 104 -u critical "Wi-fi isključen!"
# --------------------------------------------------------------------------- #
echo "$wifi" > /home/korisnik/.dwm/blocks/wifi_prev
# --------------------------------------------------------------------------- #
b1_f="^c#ff7755^"
bg_d="^b#2e2e31^"
fg_d="^c#e0e0e0^"
# --------------------------------------------------------------------------- #
# wifi=""
# wifi="59"
# --------------------------------------------------------------------------- #
if [ "$wifi" = "" ]; then
	wifi_snaga="$b1_f$wifi_ikona [x]$fg_d"
else
	wifi=$((wifi*100/70));
	if [ $wifi -lt 34 ]; then
		wifi_snaga="$b1_f$wifi_ikona $wifi%$fg_d"
	else
		if [ $wifi = 100 ]; then
			wifi_snaga="$wifi_ikona [≡]"
		else
			wifi_snaga="$wifi_ikona $wifi%"
		fi
	fi
fi
# --------------------------------------------------------------------------- #
# sken=$(sudo wpa_cli scan)
# mreze=$(sudo wpa_cli scan_results | awk 'NF>3 && NF<10 { printf("* %s (%s)\n", $NF, $3)  }')

case $BLOCK_BUTTON in
	3)
		sken=$(sudo wpa_cli scan && sudo wpa_cli scan_results | awk 'NF>3 && NF<10 { printf("- %s (%s) %s\n", $5, $3, $4)  }' | sort -V -k3 | column -t) &&
		dunstify -r 104 -t 60000 "$sken" ;;
esac
# --------------------------------------------------------------------------- #
echo " $wifi_snaga "

