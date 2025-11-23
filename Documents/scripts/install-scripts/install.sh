#!/usr/bin/env bash
CDOT_INSTALL=~/Documents/scripts/install-scripts

# Exit immediately if a command exits with a non-zero status
set -e

catch_errors() {
  echo -e "\n\e[31mCapndot installation failed!\e[0m"
  echo "You can retry by running: bash ~/capndot/install.sh"
}

trap catch_errors ERR

show_logo() {
  clear
  echo -e "\033[96m"
  cat <"$CDOT_INSTALL"/logo.txt
  echo -e "\033[0m"
}

show_logo
