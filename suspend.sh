#!/bin/sh

echo "🔋 Preparing to suspend..."

# Step 1: Ensure axp221-pek (power button) is set as a wakeup source
PEK_WAKEUP_PATH="/sys/devices/platform/soc/1f03400.rsb/sunxi-rsb-3a3/axp221-pek/power/wakeup"

if [ -f "$PEK_WAKEUP_PATH" ]; then
  echo "✅ Enabling power button wakeup at $PEK_WAKEUP_PATH"
  echo enabled > "$PEK_WAKEUP_PATH"
else
  echo "❌ Power button wakeup path not found!"
  exit 1
fi

# Optional: prevent shutdown if elogind is active
#if [ -f /etc/elogind/logind.conf ]; then
#  echo "🛑 Setting HandlePowerKey=ignore to prevent shutdown..."
#  sed -i 's/^#\?HandlePowerKey=.*/HandlePowerKey=ignore/' /etc/elogind/logind.conf
#  rc-service elogind restart
#fi

# Step 2: Suspend
echo "💤 Suspending now. Press power button to wake."
echo mem > /sys/power/state

