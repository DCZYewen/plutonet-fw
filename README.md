# Pluto-Net Firware

This repository is originated from [plutosdr-fw](https://github.com/analogdevicesinc/plutosdr-fw), version 0.38.

The original README from ADI is [here](hhttps://github.com/DCZYewen/plutonet-fw/blob/master/README_adi.md).

This repository contains firmware of [Pluto-Net](https://github.com/DCZYewen/plutonet-hw) hardware, the software and hardware contains ABSOLUTLY NO warrenty. There is no guarantee that the hardware and firmware would perform as normal.

Legal info contained in build artifacts.

## Requirements

Ubuntu 20.04

Xilinx Vivado 2022.2

Xilinx Vitis 2022.2

git
build-essential
fakeroot
libncurses5-dev
libssl-dev
ccache
dfu-util
u-boot-tools

device-tree-compiler
libssl1.0-dev mtools
bc
python
cpio
zip
unzip
rsync
file

wget
cpio
file
device-tree-compiler
flex
bison
libgmp-dev
libmpc-dev
build-essential

### Notes
The Ubuntu 20.04 official repository has deprecated libssl-dev, use dpkg install deb package `dependency/libssl1.0.2_1.0.2u-1~deb9u7_amd64.deb` to meet the requirements by this project.

Only tested under ubuntu 20.04 and Vivado 2022.2, gcc 9.4.0.

## Build Instructions

Clone this repository with `git clone https://github.com/DCZYewen/plutonet-fw`.

Init the submodule of git repo, `git submodule update --init --recursive`.

Edit the Makefile and setupenv to specify your custom Xilinx Design Tool Kit path.

Generate a serial by script `generate_serial.sh random` or `generate_serial.sh your_costom_serial`. (The original design uses micron's api flash, the old ways to read unique id is not valid on Winbond/GigaDevice products.)

Do `make clean && make $$ bash collect_artifacts.sh`, check the `build/firmware.zip`.

If you wanted to flash the firmware, run `bash flash_firmware_dfu.sh`. If your hardware is blank, or bootloader is corrupted, use Vivado to program the boot.bin with fsbl.elf from the firmware.zip.

You can customize the device's network MAC address by edit the dts in `linux/arch/arm/boot/dts/zynq-pluto-sdr-revb.dts`.

## Changes

Edited the original xc7z0101clg225 to xc7z0101clg400, which provides more MIOs to achieve SD card and ethernet capabilities.

Edited linux kernel dts to make the Broadcom BCM54612E PHY work.

Edited the some scripts to make the compile and collect work easier.

Edited the uboot to let the ethernet work and dual core cpu support.

Edited buildroot to add some more utilities to better evaluate the performance of the board.

Edited buildroot to support hardware serial num to support single host multiple devices.

Edited the firmware version cuz MATLAB extension refuses to work under dirty builds.

## Build artifacts

| File  | Comment |
| ------------- | ------------- | 
| pluto.frm | Main PlutoSDR firmware file used with the USB Mass Storage Device |
| pluto.dfu | Main PlutoSDR firmware file used in DFU mode |
| boot.frm  | First and Second Stage Bootloader (u-boot + fsbl + uEnv) used with the USB Mass Storage Device |
| boot.dfu  | First and Second Stage Bootloader (u-boot + fsbl) used in DFU mode |
| uboot-env.dfu  | u-boot default environment used in DFU mode |
| plutosdr-fw-vX.XX.zip  | ZIP archive containg all of the files above |  
| plutosdr-jtag-bootstrap-vX.XX.zip  | ZIP archive containg u-boot and Vivao TCL used for JATG bootstrapping |
| firmware.zip | ZIOP archive containg all arrtifacts to flash a Pluto-Net from scrach. |