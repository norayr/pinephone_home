chmod 777 /sys/class/power_supply/axp20x-usb/input_current_limit
echo 1500000 > /sys/class/power_supply/axp20x-usb/input_current_limit
#echo 2000000 > /sys/class/power_supply/axp20x-usb/input_current_limit
echo "axp20x-usb/input_current_limit"
cat /sys/class/power_supply/axp20x-usb/input_current_limit
echo "ip5xxx-battery/current_now"
cat /sys/class/power_supply/ip5xxx-battery/current_now
echo "axp20x-battery/current_now"
cat /sys/class/power_supply/axp20x-battery/current_now
echo "ip5xxx-battery/status"
cat /sys/class/power_supply/ip5xxx-battery/status
echo "axp20x/status"
cat /sys/class/power_supply/axp20x-battery/status


upower -d | grep -i perc

