PARIS_TIME=$(TZ="Europe/Paris" date '+%H:%M')
calendarfr=(
  icon=cal
  icon.font="$FONT:Bold:12.0"
  update_freq=30
  padding_left=8
  padding_right=8
  update_freq=30
)
sketchybar --add item calendarfr right       \
           --set calendarfr  label="$PARIS_TIME" icon="🇫🇷" \
           --subscribe calendar system_woke
