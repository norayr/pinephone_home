  if [[ "$(hostname)" != "lovelace" ]]; then
  echo "This script can only run on the 'lovelace' hostname."
  exit 1
fi

# Continue with the rest of your script below...

  doas acpitool -s
  ST=`cat /proc/acpi/button/lid/LID0/state | awk {' print $2 '}`
  while [ "$ST" == "closed" ]; do
  ST=`cat /proc/acpi/button/lid/LID0/state | awk {' print $2 '}`
    echo "closed"
    doas acpitool -s
    sleep 5;
  done

#doas acpitool -s
#doas acpitool -s
#doas acpitool -s
#doas acpitool -s
#doas acpitool -s
#doas acpitool -s
#doas acpitool -s
