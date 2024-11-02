#!/bin/bash

BOOT_BIN="./build/boot.bin"
FSBL_ELF="./build/sdk/fsbl/Release/fsbl.elf"
BOOT_DFU="./build/boot.dfu"
UBOOT_ENV="./build/uboot-env.dfu"
PLUTO_DFU="./build/pluto.dfu"

ZIP_FILE="./build/firmware.zip"

if [[ ! -f "$BOOT_BIN" ]]; then
    echo "Error: $BOOT_BIN does not exist."
    exit 1
fi

if [[ ! -f "$PLUTO_DFU" ]]; then
    echo "Error: $PLUTO_DFU does not exist."
    exit 1
fi

if [[ ! -f "$FSBL_ELF" ]]; then
    echo "Error: $FSBL_ELF does not exist."
    exit 1
fi

if [[ ! -f "$BOOT_DFU" ]]; then
    echo "Error: $BOOT_DFU does not exist."
    exit 1
fi

if [[ ! -f "$UBOOT_ENV" ]]; then
    echo "Error: $UBOOT_ENV does not exist."
    exit 1
fi

zip -j "$ZIP_FILE" "$BOOT_BIN" "$PLUTO_DFU" "$UBOOT_ENV" "$FSBL_ELF" "$BOOT_DFU"

if [[ $? -eq 0 ]]; then
    echo "Successfully created $ZIP_FILE."
else
    echo "Failed to create $ZIP_FILE."
    exit 1
fi
