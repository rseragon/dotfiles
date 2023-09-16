#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "$0 <program-name>"
    exit 1
fi

for pid in $(ps ax | grep $1 | grep -v grep | gawk '{ print $1 }'); do
    kill -9 $pid
done
