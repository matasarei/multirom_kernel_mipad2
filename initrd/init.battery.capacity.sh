#!/system/bin/sh
# Copyright (c) LVware

grep --line-buffered -w 'adjust_soc:' /dev/kmsg |while read n n n s n; do echo $((s?s:1)) >/sys/class/power_supply/battery/capacity; done&
