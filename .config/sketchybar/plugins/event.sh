#!/bin/bash

EVENT="$(icalBuddy \
  -ic 'conner.n.rose@gmail.com,cnrose@umich.edu' \
  -iep 'title,datetime' \
  -ps '|, |' \
  -li 1 \
  -nc \
  -b '' \
  -n \
  eventsToday+10)"

if [ -z "$EVENT" ]; then
  EVENT="Nothing scheduled!"
fi

sketchybar --set event label="$EVENT"

click() {
  CURRENT_WIDTH="$(sketchybar --query $NAME | jq -r .label.width)"

  WIDTH=0
  if [ "$CURRENT_WIDTH" -eq "0" ]; then
    WIDTH=dynamic
  fi

  sketchybar --animate sin 20 --set $NAME label.width="$WIDTH"
}

case "$SENDER" in
  "mouse.clicked") click
    ;;
esac
