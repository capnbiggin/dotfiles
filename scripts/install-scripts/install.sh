#!/usr/bin/env bash

. "$HOME/Documents/scripts/script-beginer.sh"

INSTALL_DIR=$HOME/Documents/scripts/install-scripts

# Must not be running as root
if [ "$EUID" -eq 0 ]; then
  log_warning "\nDo not run this script as root!!\n"
  exit 1
fi

show_logo() {
  clear
  echo -e "$CYAN"
  cat <"$INSTALL_DIR"/logo.txt
  echo -e "$NC"
}

sudo pacman -Syyu --noconfirm --needed

show_logo

source "$INSTALL_DIR"/preflight/all.sh
source "$INSTALL_DIR"/config/all.sh
source "$INSTALL_DIR"/development/all.sh
source "$INSTALL_DIR"/desktops/all.sh
