#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    aft-mtp-mount ~/mnt
else
    fusermount -u ~/mnt
fi
