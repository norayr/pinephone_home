#!/bin/bash

# Get PinePhone internal battery charge
PHONE_BATTERY_PATH="/sys/class/power_supply/axp20x-battery"
PHONE_BATTERY_CAPACITY=$(cat "$PHONE_BATTERY_PATH/capacity")
PHONE_BATTERY_STATUS=$(cat "$PHONE_BATTERY_PATH/status")

# Get PinePhone keyboard battery charge (IP5xxx)
KEYBOARD_BATTERY_PATH="/sys/class/power_supply/ip5xxx-battery"
KEYBOARD_BATTERY_CAPACITY=$(cat "$KEYBOARD_BATTERY_PATH/capacity" 2>/dev/null)
KEYBOARD_BATTERY_STATUS=$(cat "$KEYBOARD_BATTERY_PATH/status" 2>/dev/null)

# Display results
echo "PinePhone Battery: $PHONE_BATTERY_CAPACITY% ($PHONE_BATTERY_STATUS)"
if [ -n "$KEYBOARD_BATTERY_CAPACITY" ]; then
    echo "PinePhone Keyboard Battery: $KEYBOARD_BATTERY_CAPACITY% ($KEYBOARD_BATTERY_STATUS)"
else
    echo "PinePhone Keyboard Battery: Not detected or unavailable"
fi


