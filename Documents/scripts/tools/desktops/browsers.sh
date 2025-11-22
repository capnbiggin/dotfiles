#!/usr/bin/env bash

PACKAGES=(
  chromium
  google-chrome
  )


for pkg in "${PACKAGES[@]}"; do
  yay -S --noconfirm --needed $pkg
done
