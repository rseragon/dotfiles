#!/usr/bin/env bash

RED="\x1B[31m"
GREEN="\x1B[32m"
YELLOW="\x1B[01;93m"
RESET="\x1B[0m"

# Debug env flags
ENV_DBG_FLAGS="RUST_BACKTRACE=1"

if [[ -z $1 ]]; then
    echo "$0 <file> <mode>"
    exit 1
fi

rustc "$1" -v

if [[ $? != 0 ]]; then
    echo -e "${RED} Failed to compile $1 ${RESET}"
    exit 1
fi

EXEFILE=./$(echo "$1" | cut -d '.' -f 1)
EXECMD="${ENV_DBG_FLAGS} "

export RUST_BACKTRACE=1
./"${EXEFILE}"
