cat /sys/class/power_supply/axp20x-usb/input_current_limit
cat /sys/class/power_supply/axp20x-battery/current_now
cat /sys/class/power_supply/ip5xxx-battery/current_now
upower -d | grep perc
