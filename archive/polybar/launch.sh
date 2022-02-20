#!/bin/bash

# Create a link for CPU temp file cause the ID sometimes changes
cpu_id=$(ls /sys/devices/platform/coretemp.0/hwmon)
ln -s "/sys/devices/platform/coretemp.0/hwmon/$cpu_id/temp1_input" "/tmp/cpu-temp" 2>/dev/null

# Wait for all monitors to wake up
sleep 5

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch bar on each display
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar -q main -c "$HOME/.config/polybar/config.ini" & disown
done
