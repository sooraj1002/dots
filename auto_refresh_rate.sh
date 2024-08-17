#!/bin/bash

# Set the battery threshold
BATTERY_THRESHOLD=40
# Set the desired refresh rate
REFRESH_RATE="60.00"

# Get the current battery level
BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT1/capacity)

if [ "$BATTERY_LEVEL" -lt "$BATTERY_THRESHOLD" ]; then
    # Get the current connected display
    DISPLAY=$(xrandr | grep " connected" | cut -f1 -d" ")

    # Apply the desired refresh rate
    xrandr --output $DISPLAY --rate $REFRESH_RATE
fi
