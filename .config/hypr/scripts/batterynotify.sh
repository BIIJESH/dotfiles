#!/bin/bash

while true; do
    battery_status=$(cat /sys/class/power_supply/BAT0/status)
    battery_percentage=$(cat /sys/class/power_supply/BAT0/capacity)

    if [ "$battery_status" == "Discharging" ] && [ "$battery_percentage" -le 20 ]; then
        dunstify -u CRITICAL "Battery Low" "Battery is at $battery_percentage%."
    fi

    if [ "$battery_status" == "Charging" ] && [ "$battery_percentage" -ge 98 ]; then
        dunstify -u NORMAL "Battery Charged" "Battery is at $battery_percentage%."
    fi

    sleep 180
done
