#!/bin/bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15")

# Destroy space on right click, focus space on left click.
# New space by left clicking separator (>)

sid=0
spaces=()
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))

  space=(
    associated_space=$sid
    padding_left=2
    padding_right=2
    label.padding_right=10
    label.padding_left=10
    icon.highlight_color=$BLACK
    label.color=$TOKYO_NIGHT_FG
    icon.color=$TOKYO_NIGHT_FG
    label.highlight_color=$BLACK
    label.font="sketchybar-app-font:Regular:16.0"
    # background.color=$TRANSLUCENT_WHITE
    background.drawing=off
    label.drawing=off
    script="$PLUGIN_DIR/space.sh"
  )

  sketchybar --add space space.$sid left    \
             --set space.$sid "${space[@]}" \
             --subscribe space.$sid mouse.clicked
done

