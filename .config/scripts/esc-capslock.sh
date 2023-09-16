#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "$#"
    exit
fi

if [ $1 -le 2 ]; then
    xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
else
    count=`ps ax | grep -e "[nv|v]im" | wc -l`
    echo "$count"
    if [ $count -le 2 ]; then
        xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
    fi
fi
