#!/usr/bin/env bash
set -eu

# Set your terminal:
TERM="ghostty"

# Directories
DEV="$HOME/Documents/dev"
SCRIPT_DIR="$HOME/.dotfiles/scripts"
MY_BRAIN="$HOME/Documents/My-Brain"

# Pick repo
configs="$(find "$DEV"/*/ -maxdepth 0 -print0 | xargs -0 -n1 basename)"
[ -n "$configs" ] || exit 0
scripts="$(basename "$SCRIPT_DIR")"
[ -n "$scripts" ] || exit 0
brain="$(basename "$MY_BRAIN")"
[ -n "$brain" ] || exit 0
chosen="$(printf '%s\n' "$configs" "$scripts" "$brain" |
  rofi -dmenu -p 'Projects:')"
[ -n "$chosen" ] || exit 0
if [[ "$chosen" == "scripts" ]]; then
  dir="$SCRIPT_DIR"
elif [[ "$chosen" == "My-Brain" ]]; then
  dir="$MY_BRAIN"
else
  dir="$DEV/$chosen"
fi

# Nuke any existing terminal (since you only use one terminal)
# pkill -x $terminal 2>/dev/null || true
# sleep 0.1

# Launch a clean terminal: attach if exists, else create
exec $TERM -e tmux new-session -As "$chosen" -c "$dir"
