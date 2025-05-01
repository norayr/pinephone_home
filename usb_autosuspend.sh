echo "auto" > /sys/bus/platform/devices/musb-hdrc.2.auto/power/control

for dev in /sys/bus/usb/devices/*/power/control; do
  echo auto > "$dev"
done

