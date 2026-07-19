#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

WALL_DIR="$ACTUAL_HOME/dotfiles/wallpapers"
CACHE_DIR="$ACTUAL_HOME/.cache/thumbnails/large"  # Standard XDG thumbnail cache

# Ensure thumbnail cache exists
mkdir -p "$CACHE_DIR"

# Generate entries with thumbnails (rofi will auto-generate if missing)
find "$WALL_DIR" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) -print0 |
    while IFS= read -r -d '' file; do
        basename=$(basename "$file")
        echo -en "$basename\0icon\x1fthumbnail://$file\n"
    done |
    rofi -dmenu \
         -show-icons \
         -theme ~/.config/rofi/launchers/type-2/style-13.rasi \
         -p "Select Wallpaper" |
    while read -r selected; do
        if [[ -n "$selected" ]]; then
            full_path="$WALL_DIR/$selected"
            # Set wallpaper with swww (smooth transition)
            awww img "$full_path" --transition-type center --transition-fps 60 --transition-duration 1  
            sleep 2
            iris -i $(eval echo "$full_path") --dark 1
            # iris -i $(echo "$full_path" | sed 's/ /\\ /g') --dark 1 # Update iris colors

            # Regenerate colors with matugen
            # matugen image "$full_path"

            # Optional: force reload apps if needed (kitty/gtk/hyprland already in your config)
            pkill -USR1 kitty  # Example for kitty if reload_apps doesn't catch it
        fi
    done
