#!/bin/bash

title=$(playerctl metadata title | sed -e 's/ - YouTube Music//; s/ - YouTube//; s/&/\&amp;/g; s/"/\\\"/g' | tr -d '\n')
status=$(playerctl status | tr -d '\n')

if [ ! -z "$title" ]; then
    echo "{\"alt\": \"$status\", \"tooltip\": \"$title\", \"text\": \"$title\"}" 
fi