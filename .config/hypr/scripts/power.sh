#!/bin/bash

entries=" 󰐦  Shutdown\n 󰍃  Logout\n   Suspend\n 󰑓  Reboot"

selected=$(echo -e $entries|wofi --width 250 --height 192 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  shutdown)
    exec systemctl poweroff -i;;
  logout)
    exec hyprctl dispatch exit 0;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
esac
