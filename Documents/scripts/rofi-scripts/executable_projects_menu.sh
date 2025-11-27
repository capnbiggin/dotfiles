#!/usr/bin/env bash
set -eu

ROFI_THEME="~/.config/rofi/launchers/type-1/style-1.rasi"

# Set your terminal:
terminal="ghostty"
dev="$HOME/Documents/dev"

# Pick repo
configs="$(find "$dev"/*/ -maxdepth 0 -print0 | xargs -0 -n1 basename)"
[ -n "$configs" ] || exit 0
chosen="$(printf '%s\n' "$configs" |
  rofi -dmenu -theme "$ROFI_THEME" -p 'Projects:')"
[ -n "$chosen" ] || exit 0
dir="$dev/$chosen"

# Nuke any existing terminal (since you only use one terminal)
# pkill -x $terminal 2>/dev/null || true
# sleep 0.1

# Launch a clean terminal: attach if exists, else create
exec $terminal -e tmux new-session -As "$chosen" -c "$dir"
