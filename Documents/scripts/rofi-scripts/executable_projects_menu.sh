#!/usr/bin/env bash
set -eu

# Set your terminal:
TERM="ghostty"
DEV="$HOME/Documents/dev"

# Pick repo
configs="$(find "$DEV"/*/ -maxdepth 0 -print0 | xargs -0 -n1 basename)"
[ -n "$configs" ] || exit 0
chezmoi="$(basename ~/.local/share/chezmoi)"
[ -n "$chezmoi" ] || exit 0
chosen="$(printf '%s\n' "$configs" "$chezmoi" |
  rofi -dmenu -p 'Projects:')"
[ -n "$chosen" ] || exit 0
if [[ "$chosen" == "chezmoi" ]]; then
  dir="$HOME/.local/share/chezmoi"
else
  dir="$DEV/$chosen"
fi

# Nuke any existing terminal (since you only use one terminal)
# pkill -x $terminal 2>/dev/null || true
# sleep 0.1

# Launch a clean terminal: attach if exists, else create
exec $TERM -e tmux new-session -As "$chosen" -c "$dir"
