#!/bin/bash

calendar=(
  icon=cal
  icon.font="$FONT:Bold:13.0"
  label.font="$FONT:Bold:13.0"
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
)
           sketchybar --add item calendar right       \
               --set calendar "${calendar[@]}" \
               --subscribe calendar system_woke

