#!/bin/bash

#Variables
#UNICORNBLOOD=./Unicornblood
#PREBUILT=./Unicornblood/prebuilt

YELLOW="\033[1;33m"
RED="\033[0;31m"
ENDCOLOR="\033[0m"

cd && cd Unicornblood

echo -e $YELLOW"Lets build Shamu..."$ENDCOLOR

export PATH=/home/nobe1976/Unicornblood/prebuilt/arm-eabi-4.8/bin:$PATH

export ARCH=arm && export CROSS_COMPILE=arm-eabi-

cd android_kernel_moto_shamu && make clean && make mrproper

make ARCH=arm CROSS_COMPILE=$CROSS_COMPILE shamu_defconfig

make ARCH=arm CROSS_COMPILE=$CROSS_COMPILE -j16

cd && cd Unicornblood

mv android_kernel_moto_shamu/arch/arm/boot/zImage-dtb AnyKernel2-SHAMU
cd AnyKernel2-SHAMU
zip -r9 Unicornblood-SHAMU-$(date +%m%d%Y).zip * -x README Unicornblood-SHAMU-$(date +%m%d%Y).zip

cd && cd Unicornblood

