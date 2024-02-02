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
