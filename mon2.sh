#!/bin/sh

# Read current values (in µA)
usb_in=$(cat /sys/class/power_supply/axp20x-usb/input_current_limit)
main_now=$(cat /sys/class/power_supply/axp20x-battery/current_now)
kbd_now=$(cat /sys/class/power_supply/ip5xxx-battery/current_now)

# Display raw values
echo "USB input current limit:       $usb_in µA"
echo "Main battery current_now:      $main_now µA"
echo "Keyboard battery current_now:  $kbd_now µA"

# Determine power flow
echo ""
echo "Analyzing power flow..."

# Total input: USB + any charging from keyboard
# Total output: discharging from main battery
usb_input=$usb_in
main_current=$main_now
kbd_current=$kbd_now

# Keyboard current is negative when charging, positive when discharging
# Main battery: negative = charging, positive = discharging

# Calculate net flow (rough estimate)
# Negative net = charging more than giving (net gain)
# Positive net = giving more than charging (net loss)
net_flow=$(( usb_input + kbd_current + main_current ))

# Show charge percentages
echo ""
echo "Battery charge levels:"
upower -d | grep perc

# Print final summary
echo ""
echo "Summary:"
if [ "$net_flow" -lt 0 ]; then
  echo "✅ Charging overall (input > output)"
elif [ "$net_flow" -gt 0 ]; then
  echo "⚠️  Discharging overall (output > input)"
else
  echo "➖ Balanced: input ~= output"
fi

# Optional: show how bad/good it is
if [ "$net_flow" -gt 0 ]; then
  echo "  You are losing power faster than it's charging."
elif [ "$net_flow" -lt 0 ]; then
  echo "  System is gaining power."
fi

