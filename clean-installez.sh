#!/bin/bash

IFS=$'\n'
MOD_LIST=(`./vcpkg list`)

unset IFS
for IT in "${MOD_LIST[@]}"
do
    ENT=($IT)
    echo "Removing: ${ENT[0]}"
    ./vcpkg remove ${ENT[0]} --recurse $@
done
