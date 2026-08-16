#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="${ACTUAL_HOME}/projects/scripts"

source "${SCRIPTS_DIR}/lib/colors.sh"
source "${SCRIPTS_DIR}/lib/common.sh"

INSTALL_DIR="${SCRIPTS_DIR}"/install

# Install Directory

source "$INSTALL_DIR"/packages.conf

for pak in "${HYPR[@]}"; do
  log_info "Installing $pak"
  yay -S --needed --noconfirm "$pak"
done
