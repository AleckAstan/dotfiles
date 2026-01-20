
COLOR="$WHITE"

sketchybar --add item ram right \
	--set ram \
	update_freq=3 \
	icon.color="$COLOR" \
	icon.padding_left=10 \
	label.color="$COLOR" \
	label.padding_right=10 \
	background.height=26 \
	background.padding_right=5 \
	background.drawing=on \
	script="$PLUGIN_DIR/ram.sh"
