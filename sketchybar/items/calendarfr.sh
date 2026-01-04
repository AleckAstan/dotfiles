calendarfr=(
  icon=cal
  icon.font="$FONT:Bold:12.0"
  update_freq=30
  padding_left=4
  padding_right=4
  script="$PLUGIN_DIR/calendarfr.sh"
)
sketchybar --add item calendarfr right       \
           --set calendarfr "${calendarfr[@]}" \
           --subscribe calendar system_woke
