#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="${ACTUAL_HOME}/projects/scripts"
LIB_DIR="${SCRIPTS_DIR}/lib"

[ -f "${LIB_DIR}/colors.sh" ] && source "${LIB_DIR}/colors.sh"
[ -f "${LIB_DIR}/common.sh" ] && source "${LIB_DIR}/common.sh"

[ -f "${SCRIPTS_DIR}/install/packages.conf" ] && source "${SCRIPTS_DIR}/install/packages.conf"

for pak in "${BASE[@]}"; do
  log_info "Installing $pak"
  yay -S --needed --noconfirm "$pak"
done
