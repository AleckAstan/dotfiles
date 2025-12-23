#!/usr/bin/env bash
session=$(tmux display-message -p '#S' 2>/dev/null)
window=$(tmux display-message -p '#W' 2>/dev/null)
pane=$(tmux display-message -p '#P' 2>/dev/null)

label="  $session  ▸  $window  ▸  $pane"

sketchybar --set tmux icon="TMUX" label="$(tmux display-message -p '#P' 2>/dev/null)"
