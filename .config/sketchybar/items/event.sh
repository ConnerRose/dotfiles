#!/bin/bash

event=(
  icon="󰃭"
  icon.font="$FONT:Black:16.0"
  icon.padding_right=5
  padding_left=0
  padding_right=15
  update_freq=30
  script="$PLUGIN_DIR/event.sh"
  label.width=0
)

sketchybar --add item event right       \
  --set event "${event[@]}" \
  --subscribe event system_woke mouse.clicked
