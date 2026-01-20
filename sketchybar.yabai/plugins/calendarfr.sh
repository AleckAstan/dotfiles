#!/bin/bash
PARIS_TIME=$(TZ="Europe/Paris" date '+%H:%M')
sketchybar --set $NAME label="$PARIS_TIME" icon="🇫🇷"
