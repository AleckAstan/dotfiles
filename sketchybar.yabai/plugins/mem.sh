#!/usr/bin/env bash

VM_STATS=$(vm_stat)

PAGE_SIZE=$(echo "$VM_STATS" | awk '/page size of/ {print $8}')
PAGES_ACTIVE=$(echo "$VM_STATS" | awk '/Pages active:/ {print $3}' | tr -d '.')
PAGES_WIRED=$(echo "$VM_STATS" | awk '/Pages wired down:/ {print $4}' | tr -d '.')
PAGES_COMPRESSED=$(echo "$VM_STATS" | awk '/Pages occupied by compressor:/ {print $5}' | tr -d '.')

USED_MB=$(awk -v ps="$PAGE_SIZE" -v a="$PAGES_ACTIVE" -v w="$PAGES_WIRED" -v c="$PAGES_COMPRESSED" \
  'BEGIN { printf "%.0f", (a + w + c) * ps / 1024 / 1024 / 1024}')

# echo "Used: $USED_MB GB"

sketchybar --set $NAME icon=":ram:" icon.font="sketchybar-app-font:Regular:14" label="$USED_MB GB"

