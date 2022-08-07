#!/bin/bash

# ⚠️  🔋 🔌 ⚡ 💾 📂 ∣ │ ╎ ╏ ╵ ╷ ▕ ▯ ▮ ⁝⁞∣ ≡ ⋮ 

bat_stat=$(</sys/class/power_supply/BAT0/status)
bat_cap=$(</sys/class/power_supply/BAT0/capacity)

# Charging 15 25 50
# Full 
# Not Charging 5
# Discharging 5 15 25 50 75

# bat_stat="Charging"
# bat_stat="Discharging"
# bat_cap=8

ac_prev=$(cat /home/korisnik/.dwm/blocks/bat_prev_ac)
le_prev=$(cat /home/korisnik/.dwm/blocks/bat_prev_le)

if [ "$bat_stat" = "Discharging" ] && [ "$ac_prev" = "Charging" ]; then
	dunstify -r 115 -u critical "Ispravljač isključen!"
fi

if [ "$bat_stat" = "Discharging" ] && [ "$ac_prev" = "Not charging" ]; then
	dunstify -r 115 -u critical "Ispravljač isključen!"
fi

if [ "$bat_stat" = "Discharging" ] && [ "$ac_prev" = "Full" ]; then
	dunstify -r 115 -u critical "Ispravljač isključen!"
fi

if [ "$bat_stat" = "Charging" ] && [ "$ac_prev" = "Discharging" ]; then
	echo "YAY?!"
	dunstify -r 115 "Ispravljač uključen."
fi

if [ "$bat_stat" = "Not charging" ] && [ "$ac_prev" = "Discharging" ]; then
	dunstify -r 115 "Ispravljač uključen."
fi

if [ "$bat_stat" = "Full" ] && [ "$ac_prev" = "Discharging" ]; then
	dunstify -r 115 "Ispravljač uključen."
fi

if [ $bat_cap -lt 26 ] && [ $le_prev -ge 26 ]; then
	dunstify -r 115 -u critical "BATERIJA <= $bat_cap%"
fi

if [ $bat_cap -lt 16 ] && [ $le_prev -ge 16 ]; then
	dunstify -r 115 -u critical "BATERIJA <= $bat_cap%!"
fi

if [ $bat_cap -lt 9 ] && [ $le_prev -ge 9 ]; then
	dunstify -r 115 -u critical "BATERIJA <= $bat_cap% !!!"
fi

echo "$bat_stat" > /home/korisnik/.dwm/blocks/bat_prev_ac
echo "$bat_cap"  > /home/korisnik/.dwm/blocks/bat_prev_le

# case $BLOCK_BUTTON in
#     1) dunstify -r 115 "$ac_prev $le_prev" ;;
# esac

dwm_1="^c#2e2e31^"
dwm_2="^c#e0e0e0^"
dwm_3="^b#2e2e31^"
dwm_4="^b#e0e0e0^"
n1_bg="^b#ee4444^"
n1_fg="^c#ee4444^"
n2_bg="^b#bb5533^"
n2_fg="^c#cc7755^"
n3_bg="^b#ddbb55^"
n3_fg="^c#ddbb55^"
n4_bg="^b#bbbbff^"
n4_fg="^c#bbbbff^"
n5_bg="^b#7777ff^"
n5_fg="^c#7777ff^"
n6_bg="^b#77dd77^"
n6_fg="^c#77dd77^"

bat_msg_1="-"
bat_msg_2="$bat_cap% ${dwm_3}${dwm_2}"

if [ "$bat_stat" = "Charging" ]; then
	if [ $bat_cap -lt 15 ]; then
		bat_msg_1="${n1_bg}${dwm_2} 🔌⚡"
	elif [ $bat_cap -lt 25 ]; then
		bat_msg_1=" ${n2_fg}🔌⚡"
	elif [ $bat_cap -lt 50 ]; then
		bat_msg_1=" ${n3_fg}🔌⚡"
	elif [ $bat_cap -lt 85 ]; then
		bat_msg_1=" ${n5_fg}🔌⚡"
	else
		bat_msg_1=" ${n6_fg}🔌⚡"
	fi
elif [ "$bat_stat" = "Full" ]; then
	bat_msg_1=" 🔌 [F]"
	bat_msg_2=""
elif [ "$bat_stat" = "Not charging" ]; then
	if [ $bat_cap -le 5 ]; then
		bat_msg_1="${n1_bg}${dwm_2} 🔋⚠ !!!"
	else
		bat_msg_1=" ${n6_fg}🔌⚠"
	fi
else
	if [ $bat_cap -le 8 ]; then
		bat_msg_1="${n1_bg}${dwm_2} 🔋⚠"
	elif [ $bat_cap -le 15 ]; then
		bat_msg_1="${n1_bg}${dwm_1} 🔋⚠"
	elif [ $bat_cap -le 25 ]; then
		bat_msg_1="${n2_bg}${dwm_2} 🔋"
	elif [ $bat_cap -le 50 ]; then
		bat_msg_1="${n3_bg}${dwm_1} 🔋"
	elif [ $bat_cap -le 75 ]; then
		bat_msg_1="${n4_bg}${dwm_1} 🔋"
	else
		bat_msg_1="${n5_bg}${dwm_1} 🔋"
	fi
fi

echo "${bat_msg_1} ${bat_msg_2}"

