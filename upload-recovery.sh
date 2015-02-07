#!/bin/bash

MMCBLK_RECOVERY=/dev/block/mmcblk0p22

NOSU=$1

#DEVICE=`adb shell "getprop | busybox grep ro\.product\.device"`
#if [ "$DEVICE" != '[ro.product.device]: [SC-05D]' ]; then
#  echo "error: target device miss match '[ro.product.device]: [SC-05D]' vs '$DEVICE'"
#  exit -1
#fi

if [ "$NOSU" = "nosu" ]; then
  adb push ./out/RECO/bin/recovery.img /tmp/recovery.img
  adb shell "cat /tmp/recovery.img > $MMCBLK_RECOVERY"
  adb shell "rm /tmp/recovery.img"
  adb shell "sync;sync;sync;sleep 2; reboot recovery"
else
  adb push ./out/RECO/bin/recovery.img /data/local/tmp/recovery.img
  adb shell su -c "cat /data/local/tmp/recovery.img > $MMCBLK_RECOVERY"
  adb shell su -c "rm /data/local/tmp/recovery.img"
  adb shell su -c "sync;sync;sync;sleep 2; reboot recovery"
fi
