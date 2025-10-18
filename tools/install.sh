#!/usr/bin/env bash
CDOT_INSTALL=~/capndot/install

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
  cat <~/capndot/logo.txt
  echo -e "\033[0m"
}

show_logo

# Install Prerequisites
printf "\nInstalling AUR helper yay...\n"
source $CDOT_INSTALL/preflight/aur-yay.sh
source $CDOT_INSTALL/preflight/presentation.sh

# Config
show_logo
printf "\nStarting Capndot Install\n"
source $CDOT_INSTALL/config/identification.sh
source $CDOT_INSTALL/config/config.sh
source $CDOT_INSTALL/config/bluetooth.sh
source $CDOT_INSTALL/config/network.sh
source $CDOT_INSTALL/config/power.sh
source $CDOT_INSTALL/config/zsh-plugins.sh
source $CDOT_INSTALL/config/zsh.sh

# Desktop
show_logo
printf "\nInstalling Desktop...\n"
source $CDOT_INSTALL/desktops/hyprland.sh
source $CDOT_INSTALL/desktop/webapps.sh
source $CDOT_INSTALL/desktop/fonts.sh

# Dev
show_logo
printf "\nInstalling Terminal tools...\n"
source $CDOT_INSTALL/development/terminal.sh
source $CDOT_INSTALL/development/development.sh
source $CDOT_INSTALL/development/nvim.sh
source $CDOT_INSTALL/development/docker.sh
source $CDOT_INSTALL/development/firewall.sh
source $CDOT_INSTALL/development/python.sh
