PEBBLE="E1:8A:FC:B4:F1:0D"
PEBBLE="E1:8A:FC:B4:F1:0F"
bluetoothctl -- power on
bluetoothctl -- agent on
bluetoothctl -- default-agent
bluetoothctl -- trust $PEBBLE
bluetoothctl -- connect $PEBBLE
