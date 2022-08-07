#!/bin/bash

# ⚠️  🔋 🔌 ⚡ 💾 📂 ∣ │ ╎ ╏ ╵ ╷ ▕ ▯ ▮ ⁝⁞∣ ≡ ⋮ 📡 📶 🌐 

wifi=$(grep 'wlan0' /proc/net/wireless | awk '{printf("%d", $3)}')
wifi_snaga="-"

b1_f="^c#ff7755^"
bg_d="^b#2e2e31^"
fg_d="^c#e0e0e0^"

# wifi=""
# wifi="59"

if [ "$wifi" = "" ]; then
	wifi_snaga="$b1_f📶 [x]$fg_d"
else
	wifi=$((wifi*100/70));
	if [ $wifi -lt 34 ]; then
		wifi_snaga="$b1_f📶 $wifi%$fg_d"
	else
		if [ $wifi = 100 ]; then
			wifi_snaga="📶 [≡]"
		else
			wifi_snaga="📶 $wifi%"
		fi
	fi
fi

echo " $wifi_snaga "
