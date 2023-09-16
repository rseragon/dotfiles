#!/usr/bin/env bash

if [[ -z $1 ]]; then
    DIR=.
else
    DIR="$1"
fi

execs=`find "${DIR}" -type f -executable -print | xargs`

printf "Delete files: [${execs}] ? (Y/n)"
read -rN1 del

del=`echo "$del" | tr '[:upper:]' '[:lower:]'`

if [[ "$del" == '' ]] || [[ "$del" == "y" ]]; then
    rm ${execs}
fi
