#!/bin/bash
###############################################################################
#
# Kernel Build Script
#
###############################################################################
# 2011-10-24 effectivesky : modified
# 2010-12-29 allydrop : created
###############################################################################
##############################################################################
# set toolchain
##############################################################################
# export PATH=$(pwd)/$(your tool chain path)/bin:$PATH
# export CROSS_COMPILE=$(your compiler prefix)
export ARCH=arm
#export PATH=$(pwd)/toolchain/arm-eabi-4.6/bin:$PATH
export PATH=~/temasek/system/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin:$PATH
export CROSS_COMPILE=~/temasek/system/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin/arm-eabi-
##############################################################################
# make zImage
##############################################################################
mkdir -p ./obj/KERNEL_OBJ/
make ARCH=arm O=./obj/KERNEL_OBJ/ msm8660_im-a800s_perf_defconfig
make -j8 ARCH=arm O=./obj/KERNEL_OBJ/

##############################################################################
# Copy Kernel Image
##############################################################################
cp -f ./obj/KERNEL_OBJ/arch/arm/boot/zImage .
mkdir -p ./modules/
cp -r `find ./obj/KERNEL_OBJ/ -iname '*.ko'` ./modules/
