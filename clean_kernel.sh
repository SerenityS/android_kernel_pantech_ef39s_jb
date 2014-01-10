#!/bin/bash
###############################################################################
#
#                           Kernel Build Script
#
###############################################################################
# 2011-10-24 effectivesky : modified
# 2010-12-29 allydrop     : created
###############################################################################
export ARCH=arm
export PATH=~/temasek/system/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin:$PATH
export CROSS_COMPILE=~/temasek/system/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin/arm-eabi-

make mrproper
make O=./obj/KERNEL_OBJ/ clean
if [ -f ./zImage ]
then
rm ./zImage
fi

if [ -d ./obj/ ]
then
rm -r ./obj/
fi
