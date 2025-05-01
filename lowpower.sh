#!/bin/sh

echo "🔋 Entering low-power mode..."

# Optional: kill X (uncomment if you want to stop X completely)
# echo "🛑 Stopping Xorg..."
# killall X xinit xcompmgr

# Turn off screen backlight
echo "💡 Dimming screen to minimum"
#light -S 0.01
#light -S 1
#xrandr --output DSI-1 --brightness 0.1 2>/dev/null

# GPU: force lowest frequency
GPUFREQ_PATH="/sys/class/devfreq/1c40000.gpu"
if [ -d "$GPUFREQ_PATH" ]; then
  echo "🎮 Locking GPU frequency"
  cat "$GPUFREQ_PATH/max_freq" > "$GPUFREQ_PATH/min_freq"
fi

# Wi-Fi power save
echo "📡 Enabling Wi-Fi power save"
iw dev wlan0 set power_save on

echo "cpu power saving"
cpupower frequency-set -g powersave

cpupower idle-set -d 0

# Optionally stop background services
echo "📦 Stopping unnecessary services"
rc-service ntpd stop 2>/dev/null
#rc-service upowerd stop 2>/dev/null
#rc-service bluetooth stop 2>/dev/null

# Turn off HDMI (if active)
echo auto > /sys/bus/platform/devices/1ee0000.hdmi/power/control

# emmc autosuspend
echo auto > /sys/bus/mmc/devices/mmc1:0001/power/control

# Optional: blank screen (comment if you want to keep screen usable)
# echo "🖥️  Blanking framebuffer"
echo 1 > /sys/class/graphics/fb0/blank

# Show battery status
echo "📊 Checking power draw..."
sleep 1
sh mon.sh

