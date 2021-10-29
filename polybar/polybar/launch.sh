#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch bar on each display
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar -q --reload main -c "$HOME/.config/polybar/config.ini" & disown
done
