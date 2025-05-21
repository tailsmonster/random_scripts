#!/bin/bash

# Check if Bluetooth is enabled using bluetoothctl
STATUS=$(bluetoothctl show | grep -i 'Powered' | awk '{print $2}')

if [ "$STATUS" = "yes" ]; then
    echo "" && exit
else
    echo "󰂲" && exit
fi
