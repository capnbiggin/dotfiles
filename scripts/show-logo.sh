#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# # Script Directory
SCRIPTS_DIR="${ACTUAL_HOME}/projects/scripts"

source "${SCRIPTS_DIR}/lib/colors.sh"

clear
echo -e "${CYAN}"
cat <"${SCRIPTS_DIR}/lib/logo.txt"
echo -e "${NC}"
echo
