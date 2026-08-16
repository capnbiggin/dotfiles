#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="${ACTUAL_HOME}/projects/scripts"

source "${SCRIPTS_DIR}/lib/colors.sh"
source "${SCRIPTS_DIR}/lib/common.sh"

FONTS=(
  ttf-font-awesome
  ttf-roboto
  ttf-font-awesome
  ttf-cascadia-mono-nerd
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  ttf-dejavu
  ttf-liberation
)

printf "\nDownloading Fonts...\n"

for font in "${FONTS[@]}"; do
  log_info "\nInstalling Font $font\n"
  yay -S --needed --noconfirm "$font"
done
