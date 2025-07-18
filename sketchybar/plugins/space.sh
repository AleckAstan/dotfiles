#!/bin/bash

#echo space.sh $'FOCUSED_WORKSPACE': $FOCUSED_WORKSPACE, $'SELECTED': $SELECTED, NAME: $NAME, SENDER: $SENDER  >> ~/aaaa

# update() {
#   if [ "$SENDER" = "space_change" ]; then
#     source "$CONFIG_DIR/colors.sh"
#     COLOR=$TRANSLUCENT_WHITE
#     if [ "$SELECTED" = "true" ]; then
#       COLOR=$WHITE
#     fi
#     
#     sketchybar --set space.$(aerospace list-workspaces --focused) icon.highlight=true \
#                       label.highlight=true \
#                       background.color=$WHITE
#   fi
# }

set_space_label() {
  sketchybar --set $NAME icon="$@"
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    # yabai -m space --destroy $SID
    echo ''
  else
    if [ "$MODIFIER" = "shift" ]; then
      SPACE_LABEL="$(osascript -e "return (text returned of (display dialog \"Give a name to space $NAME:\" default answer \"\" with icon note buttons {\"Cancel\", \"Continue\"} default button \"Continue\"))")"
      if [ $? -eq 0 ]; then
        if [ "$SPACE_LABEL" = "" ]; then
          set_space_label "${NAME:6}"
        else
          set_space_label "${NAME:6} ($SPACE_LABEL)"
        fi
      fi
    else
      aerospace workspace ${NAME#*.}
    fi
  fi
}

# echo plugin_space.sh $SENDER >> ~/aaaa
case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
