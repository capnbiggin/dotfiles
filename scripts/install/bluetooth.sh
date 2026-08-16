#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="${ACTUAL_HOME}/projects/scripts"

source "${SCRIPTS_DIR}/lib/colors.sh"
source "${SCRIPTS_DIR}/lib/common.sh"

# Install Directory

source "$INSTALL_DIR"/packages.conf

log_info "\nInstalling blueman Bluetooh controls\n"
yay -S --noconfirm --needed bluez bluez-utils blueman

log_info "\nTurning on bluetooth servise by default\n"
sudo systemctl enable --now bluetooth
