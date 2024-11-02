#!/bin/bash

FIRMWARE_DIR="./build"
dfu-util -D "${FIRMWARE_DIR}/pluto.dfu" -a 1
dfu-util -D "${FIRMWARE_DIR}/boot.dfu" -a 0
dfu-util -D "${FIRMWARE_DIR}/uboot-env.dfu" -a 3

echo "Done.."
