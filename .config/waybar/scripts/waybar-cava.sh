#! /bin/bash

bar="▁▂▃▄▅▆▇█"
dict="s/;//g;"

i=0
while [ $i -lt ${#bar} ]
do
    dict="${dict}s/$i/${bar:$i:1}/g;"
    i=$((i=i+1))
done

killall cava
cava -p ~/.config/cava/config-waybar | while read -r line; do
    echo $line | sed $dict
done
