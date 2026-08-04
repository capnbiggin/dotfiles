#!/usr/bin/env bash

source "${HOME}"/projects/scripts/lib/env.sh
source "${LIB_DIR}"/colors.sh
source "${LIB_DIR}"/common.sh

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
