#!/bin/bash

#Variables
#UNICORNBLOOD=./Unicornblood
#PREBUILT=./Unicornblood/prebuilt

YELLOW="\033[1;33m"
RED="\033[0;31m"
ENDCOLOR="\033[0m"

cd && cd Unicornblood

rm -rf AnyKernel2-SHAMU AnyKernel2-HAMMERHEAD AnyKernel2-MAKO AnyKernel2-BULLHEAD AnyKernel2-ANGLER

repo sync

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

echo -e $YELLOW"Lets build Hammerhead..."$ENDCOLOR

export PATH=/home/nobe1976/Unicornblood/prebuilt/arm-eabi-4.8/bin:$PATH

export ARCH=arm && export CROSS_COMPILE=arm-eabi-

make ARCH=arm CROSS_COMPILE=$CROSS_COMPILE hammerhead_defconfig

make ARCH=arm CROSS_COMPILE=$CROSS_COMPILE -j16

cd && cd Unicornblood

mv android_kernel_lge_hammerhead/arch/arm/boot/zImage-dtb AnyKernel2-HAMMERHEAD
cd AnyKernel2-HAMMERHEAD
zip -r9 Unicornblood-HAMMERHEAD-$(date +%m%d%Y).zip * -x README Unicornblood-HAMMERHEAD-$(date +%m%d%Y).zip

cd && cd Unicornblood

echo -e $YELLOW"Mako Please..."$ENDCOLOR

export PATH=/home/nobe1976/Unicornblood/prebuilt/arm-eabi-4.8/bin:$PATH

export ARCH=arm && export CROSS_COMPILE=arm-eabi-

cd android_kernel_lge_mako && make clean && make mrproper

make ARCH=arm CROSS_COMPILE=$CROSS_COMPILE mako_defconfig

make ARCH=arm CROSS_COMPILE=$CROSS_COMPILE -j16

cd && cd Unicornblood

mv android_kernel_lge_mako/arch/arm/boot/zImage AnyKernel2-MAKO
cd AnyKernel2-MAKO
zip -r9 Unicornblood-MAKO-$(date +%m%d%Y).zip * -x README Unicornblood-MAKO-$(date +%m%d%Y).zip

cd && cd Unicornblood

echo -e $YELLOW"Lets build Bullhead Next..."$ENDCOLOR

export PATH=/home/nobe1976/Unicornblood/prebuilt/aarch64-linux-android-4.9/bin:$PATH

export ARCH=arm64 && export CROSS_COMPILE=aarch64-linux-android-

cd android_kernel_lge_bullhead && make clean && make mrproper

make ARCH=arm64 CROSS_COMPILE=$CROSS_COMPILE bullhead_defconfig

make ARCH=arm64 CROSS_COMPILE=$CROSS_COMPILE -j16

cd && cd Unicornblood

mv android_kernel_lge_bullhead/arch/arm64/boot/Image.gz-dtb AnyKernel2-BULLHEAD
cd AnyKernel2-BULLHEAD
zip -r9 Unicornblood-BULLHEAD-$(date +%m%d%Y).zip * -x README Unicornblood-BULLHEAD-$(date +%m%d%Y).zip

cd && cd Unicornblood

echo -e $YELLOW"Lets build Angler..."$ENDCOLOR

export PATH=/home/nobe1976/Unicornblood/prebuilt/aarch64-linux-android-4.9/bin:$PATH

export ARCH=arm64 && export CROSS_COMPILE=aarch64-linux-android-

cd android_kernel_huawei_angler && make clean && make mrproper

make ARCH=arm64 CROSS_COMPILE=$CROSS_COMPILE angler_defconfig

make ARCH=arm64 CROSS_COMPILE=$CROSS_COMPILE -j16

cd && cd Unicornblood

mv android_kernel_huawei_angler/arch/arm64/boot/Image.gz-dtb AnyKernel2-ANGLER
cd AnyKernel2-ANGLER
zip -r9 Unicornblood-ANGLER-$(date +%m%d%Y).zip * -x README Unicornblood-ANGLER-$(date +%m%d%Y).zip

cd && cd Unicornblood

