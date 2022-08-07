#!/bin/bash

datetime=$(date +'%d.%m.%Y %H:%M:%S')
battery_charge=$(($(cat /sys/class/power_supply/BATT/charge_now)/100000))'%'
battery_status=$(cat /sys/class/power_supply/BATT/status)
if [[ $battery_status == 'Charging' ]]; then
  battery_status=⚡
elif [[ $battery_status == 'Discharging' ]]; then
  battery_status=🔋
else
  battery_status=😁
fi
backlight=$(($(cat /sys/class/backlight/amdgpu_bl0/brightness)*100/255))'%'
volume=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
#volume='?'

echo 🔊 $volume ☀️ $backlight $battery_status $battery_charge $datetime 
