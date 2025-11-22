#!/usr/bin/env bash

FONTS=(
  ttf-jetbrains-mono-nerd
  ttf-font-awesome
  ttf-roboto
  noto-fonts
  noto-fonts-cjk
  noto-fonts-extra
  noto-fonts-emoji
  ttf-font-awesome
  ttf-cascadia-mono-nerd
)

printf "\nDownloading Fonts...\n"

for font in "${FONTS[@]}"; do
  yay -S --needed --noconfirm $font
done
