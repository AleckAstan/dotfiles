#!/usr/bin/env bash

COLOR="$WHITE"

sketchybar --add item mem right \
	--set mem \
	update_freq=10 \
	icon.color="$TOKYO_NIGHT_BLUE" \
	label.color="$COLOR" \
	background.drawing=on \
	script="$PLUGIN_DIR/mem.sh"


sketchybar --add item cpu right \
	--set cpu \
	update_freq=10 \
	icon.color="$TOKYO_NIGHT_GREEN" \
	label.color="$COLOR" \
	background.drawing=on \
	script="$PLUGIN_DIR/cpu.sh"
