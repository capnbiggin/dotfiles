#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="${ACTUAL_HOME}/projects/scripts"

source "${SCRIPTS_DIR}/lib/colors.sh"
source "${SCRIPTS_DIR}/lib/common.sh"

# Install Directory
INSTALL_DIR="${SCRIPTS_DIR}/install"

# Check if running as root user
if [ "$EUID" -eq 0 ]; then
  log_error "\nDo not run this script as root!!\n"
  exit 1
fi

show_logo() {
  clear
  echo -e "${FG_BLUE}"
  cat <"${SCRIPTS_DIR}/lib/logo.txt"
  echo -e "${NC}"
}

# Update System
sudo pacman -Syyu --noconfirm --needed

show_logo

if ping -q -c 2 -W 1 8.8.8.8 >/dev/null 2>&1; then
  log_info "\nInternet connection is UP...  Continuing with install...\n"
else
  log_error "\nInternet connection is DOWN.. Exiting Script...\n"
  exit 1
fi

source "${SCRIPTS_DIR}/install/configs.sh"
source "${SCRIPTS_DIR}/install/aur-yay.sh"
source "${SCRIPTS_DIR}/install/gum.sh"
source "${SCRIPTS_DIR}/install/base.sh"
source "${SCRIPTS_DIR}/install/fonts.sh"
source "${SCRIPTS_DIR}/install/firewall.sh"
source "${SCRIPTS_DIR}/install/g-packs.sh"
# source "${SCRIPTS_DIR}/install/niri.sh"
# source "${SCRIPTS_DIR}/install/qtile.sh"
source "${SCRIPTS_DIR}/install/hypr.sh"
source "${SCRIPTS_DIR}/install/backlight.sh"
source "${SCRIPTS_DIR}/install/bluetooth.sh"
source "${SCRIPTS_DIR}/install/docker.sh"
# source "${SCRIPTS_DIR}/install/power.sh"
source "${SCRIPTS_DIR}/install/screen-cap.sh"
source "${SCRIPTS_DIR}/install/webapps.sh"
source "${SCRIPTS_DIR}/install/zsh.sh"

log_warning "\nRESTART NEEDED!!!"
notify-send "RESTART NEEDED" "RESTSART NEEDED"
read -rsn 1 -p "Press any key to exit..."
exit 0
