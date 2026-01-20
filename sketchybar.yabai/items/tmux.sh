#!/usr/bin/env bash
COLOR="$BLACK"


session=$(tmux display-message -p '#S' 2>/dev/null)
window=$(tmux display-message -p '#W' 2>/dev/null)
pane=$(tmux display-message -p '#P' 2>/dev/null)

label="  $session  ▸  $window  ▸  $pane"

tmux=(
  script="$PLUGIN_DIR/tmux.sh"
)
sketchybar --add event tmux_update --add item tmux right --set tmux label="$(tmux display-message -p '#W')" 


sketchybar --subscribe tmux tmux_update


