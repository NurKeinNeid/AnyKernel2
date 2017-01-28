#!/bin/bash

YELLOW="\033[1;33m"
RED="\033[0;31m"
ENDCOLOR="\033[0m"

cd && cd Unicornblood_N

echo -e $YELLOW"Lets build Hammerhead..."$ENDCOLOR

export PATH=$HOME/Unicornblood_N/prebuilt/arm-eabi-4.8/bin:$PATH

export ARCH=arm && export CROSS_COMPILE=arm-eabi-

cd android_kernel_lge_hammerhead && make clean && make mrproper

make ARCH=arm CROSS_COMPILE=$CROSS_COMPILE unicornblood_deconfig

make ARCH=arm CROSS_COMPILE=$CROSS_COMPILE -j16

cd && cd Unicornblood_N

cp -v android_kernel_lge_hammerhead/arch/arm/boot/zImage-dtb AnyKernel2-HAMMERHEAD/zImage-dtb
cd AnyKernel2-HAMMERHEAD
zip -r9 Unicornblood_N-HAMMERHEAD-$(date +%m%d%Y).zip * -x README Unicornblood_N-HAMMERHEAD-$(date +%m%d%Y).zip

cd && cd Unicornblood_N

