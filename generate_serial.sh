#!/bin/bash

file="./buildroot/board/pluto/S23udc"

if [ "$#" -ne 1 ]; then
    echo "usage: $0 <pass serial or 'random'>"
    exit 1
fi

input="$1"

if [ "$input" == "random" ]; then
    new_serial=$(openssl rand -hex 20)
    # original pluto uses MT25QU256ABA8E12's unique ID as serial,
    # which is not supported out of the box by WinBond W25Q256.
else
    new_serial="$input"
fi

sed -i "s/serial='[^']*'/serial='${new_serial}'/" "$file"

echo "New Serial: ${new_serial}"
