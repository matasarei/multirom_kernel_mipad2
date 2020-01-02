#!/system/bin/sh

while sleep 2; do
  capacity=$(cat /sys/class/power_supply/battery/capacity)

  if [ $capacity -gt 1 ]; then
    /system/bin/dumpsys battery set level $capacity
  else
    /system/bin/dumpsys battery set level 1
  fi

  if [ 'Charging' = $(cat /sys/class/power_supply/battery/status) ]; then
    /system/bin/dumpsys battery set ac 1
    /system/bin/dumpsys battery set usb 1
    /system/bin/dumpsys battery set status 2
  else
    /system/bin/dumpsys battery set ac 0
    /system/bin/dumpsys battery set usb 0
    /system/bin/dumpsys battery set status 3
  fi
done
