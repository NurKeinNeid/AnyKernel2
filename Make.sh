#!/bin/bash

#Variables
UNICORNBLOOD=~/home/*/Unicornblood
PREBUILT=/home/*/Unicornblood/prebuilt

YELLOW="\033[1;33m"
RED="\033[0;31m"
ENDCOLOR="\033[0m"

cd $UNICORNBLOOD
echo -e $YELLOW"Lets build Hammerhead..."$ENDCOLOR

export ARCH=arm
export PATH=$PREBUILT/arm-eabi-4.8/bin
export CROSS_COMPILE=$PREBUILT/arm-eabi-4.8/bin/arm-eabi-

cd android_kernel_lge_hammerhead && make clean && make mrproper && make hammerhead_defconfig && make

cd && cd $UNICORNBLOOD

mv android_kernel_lge_hammerhead/arch/arm/boot/zImage-dtb AnyKernel2-HAMMERHEAD
cd AnyKernel2-HAMMERHEAD
zip -r9 Unicornblood-HAMMERHEAD-$(date +%m%d%Y).zip * -x README Unicornblood-HAMMERHEAD-$(date +%m%d%Y).zip

cd && cd $UNICORNBLOOD

echo -e $YELLOW"Mako Please..."$ENDCOLOR

export ARCH=arm
export PATH=$PREBUILT/arm-eabi-4.8/bin
export CROSS_COMPILE=$PREBUILT/arm-eabi-4.8/bin/arm-eabi-

cd android_kernel_lge_mako && make clean && make mrproper && make mako_defconfig && make

cd && cd $UNICORNBLOOD

mv android_kernel_lge_mako/arch/arm/boot/zImage AnyKernel2-MAKO
cd AnyKernel2-MAKO
zip -r9 Unicornblood-MAKO-$(date +%m%d%Y).zip * -x README Unicornblood-MAKO-$(date +%m%d%Y).zip

cd && cd $UNICORNBLOOD

echo -e $YELLOW"Lets build Shamu..."$ENDCOLOR

export ARCH=arm
export PATH=$PREBUILT/arm-eabi-4.8/bin
export CROSS_COMPILE=$PREBUILT/arm-eabi-4.8/bin/arm-eabi-

cd android_kernel_moto_shamu && make clean && make mrproper && make shamu_defconfig && make

cd && cd $UNICORNBLOOD

mv android_kernel_moto_shamu/arch/arm/boot/zImage-dtb AnyKernel2-SHAMU
cd AnyKernel2-SHAMU
zip -r9 Unicornblood-SHAMU-$(date +%m%d%Y).zip * -x README Unicornblood-SHAMU-$(date +%m%d%Y).zip

cd && cd $UNICORNBLOOD

echo -e $YELLOW"Lets build Bullhead Next..."$ENDCOLOR

export ARCH=arm64
export PATH=$PREBUILT/aarch64-linux-android-4.9/bin
export CROSS_COMPILE=$PREBUILT/aarch64-linux-android-4.9/bin/aarch64-linux-android-

cd android_kernel_lge_bullhead && make clean && make mrproper && make bullhead_defconfig && make

cd && cd $UNICORNBLOOD

mv android_kernel_lge_bullhead/arch/arm64/boot/Image.gz-dtb AnyKernel2-BULLHEAD
cd AnyKernel2-BULLHEAD
zip -r9 Unicornblood-BULLHEAD-$(date +%m%d%Y).zip * -x README Unicornblood-BULLHEAD-$(date +%m%d%Y).zip

cd && cd $UNICORNBLOOD

echo -e $YELLOW"Lets build Angler..."$ENDCOLOR

export ARCH=arm64
export PATH=$PREBUILT/aarch64-linux-android-4.9/bin
export CROSS_COMPILE=$PREBUILT/aarch64-linux-android-4.9/bin/aarch64-linux-android-

cd android_kernel_huawei_angler && make clean && make mrproper && make angler_defconfig && make

cd && cd $UNICORNBLOOD

mv android_kernel_huawei_angler/arch/arm64/boot/Image.gz-dtb AnyKernel2-ANGLER
cd AnyKernel2-ANGLER
zip -r9 Unicornblood-ANGLER-$(date +%m%d%Y).zip * -x README Unicornblood-ANGLER-$(date +%m%d%Y).zip

cd && cd $UNICORNBLOOD

