#!/bin/bash

# Récupère la RAM physique totale (en bytes)
total_ram=$(sysctl -n hw.memsize)

# Récupère les statistiques de la RAM via vm_stat
vm_stats=$(vm_stat)

# Extraction des valeurs (vm_stat retourne des valeurs en pages de 4096 bytes)
pages_wired=$(echo "$vm_stats" | awk '/Pages wired down/ {print $4}' | tr -d '.')
pages_active=$(echo "$vm_stats" | awk '/Pages active/ {print $3}' | tr -d '.')
pages_compressed=$(echo "$vm_stats" | awk '/Pages occupied by compressor/ {print $5}' | tr -d '.')

# Calcul de la mémoire utilisée (en bytes)
# Memory Used = Wired + Active + Compressed (comme dans Activity Monitor)
ram_used_bytes=$(((pages_wired + pages_active + pages_compressed) * 4096))

# Calcul du pourcentage
ram_percentage=$(awk "BEGIN {printf \"%.0f\", ($ram_used_bytes/$total_ram)*100}")

# Calcul de la RAM utilisée en Go (optionnel, pour affichage plus détaillé)
ram_used_gb=$(awk "BEGIN {printf \"%.1f\", $ram_used_bytes / 1073741824}")

# Mise à jour de SketchyBar
sketchybar --set "$NAME" label="${ram_percentage}%"
