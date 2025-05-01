#!/bin/sh

BACKLIGHT="/sys/class/backlight/backlight/bl_power"
FRAMEBUFFER="/sys/class/graphics/fb0/blank"

# Step 1: Turn screen off
echo "🕶️  Turning screen off. Press any key to turn it back on..."
echo 1 > "$BACKLIGHT"
echo 1 > "$FRAMEBUFFER"

# Step 2: Wait for key press (from keyboard input)
stty -echo -icanon time 0 min 1
dd bs=1 count=1 2>/dev/null
stty sane

# Step 3: Turn screen back on
echo "💡 Turning screen back on!"
echo 0 > "$BACKLIGHT"
echo 0 > "$FRAMEBUFFER"

