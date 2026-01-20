#!/bin/bash

# Get total and used memory in bytes
total_mem=$(sysctl -n hw.memsize)
used_mem=$(vm_stat | grep "Pages active" | awk '{print $3}' | sed 's/\.//')
used_mem=$((used_mem * 4096)) # Convert pages to bytes (4096 bytes per page)

# Calculate percentage
ram_percentage=$((used_mem * 100 / total_mem))

# Mise à jour de SketchyBar
sketchybar --set "$NAME" label="${ram_percentage}%"
