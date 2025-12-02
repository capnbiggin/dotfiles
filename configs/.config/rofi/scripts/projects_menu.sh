#!/usr/bin/env bash
set -eu

# Set your terminal:
TERM="ghostty"

# Directories
DEV="$HOME/Documents/dev"
CHEZMOI_DIR="$HOME/.local/share/chezmoi"
SCRIPT_DIR="$HOME/Documents/scripts"

# Pick repo
configs="$(find "$DEV"/*/ -maxdepth 0 -print0 | xargs -0 -n1 basename)"
[ -n "$configs" ] || exit 0
chezmoi="$(basename "$CHEZMOI_DIR")"
[ -n "$chezmoi" ] || exit 0
scripts="$(basename "$SCRIPT_DIR")"
[ -n "$scripts" ] || exit 0
chosen="$(printf '%s\n' "$configs" "$chezmoi" "$scripts" |
  rofi -dmenu -p 'Projects:')"
[ -n "$chosen" ] || exit 0
if [[ "$chosen" == "chezmoi" ]]; then
  dir="$CHEZMOI_DIR"
elif [[ "$chosen" == "scripts" ]]; then
  dir="$SCRIPT_DIR"
else
  dir="$DEV/$chosen"
fi

# Nuke any existing terminal (since you only use one terminal)
# pkill -x $terminal 2>/dev/null || true
# sleep 0.1

# Launch a clean terminal: attach if exists, else create
exec $TERM -e tmux new-session -As "$chosen" -c "$dir"
