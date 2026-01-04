#!/bin/bash

update() {
  source "$CONFIG_DIR/colors.sh"
  COLOR=$TOKYO_NIGHT_BG_DARK
  if [ "$SELECTED" = "true" ]; then
    COLOR=$TOKYO_NIGHT_BLUE
  fi
  sketchybar --set $NAME icon.highlight=$SELECTED \
                         label.highlight=$SELECTED \
                         background.color=$COLOR
}

mouse_clicked() {
  yabai -m space --focus $SID 2>/dev/null

  # if [ "$BUTTON" = "right" ]; then
  #   yabai -m space --destroy $SID
  #   sketchybar --trigger windows_on_spaces --trigger space_change
  # else
  #   yabai -m space --focus $SID 2>/dev/null
  # fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
