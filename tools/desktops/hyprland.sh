#!/usr/bin/env bash

C='\033[0m'    # no color
G='\033[0;32m' # green color
R='\033[0;31m' # red color

HYPR=(
  hyprland
  hypridle
  hyprpicker
  hyprlock
  hyprpaper
  swww
  wl-clipboard
  rofi
  waybar
  waypaper
  wallust
  matugen
)

for pkg in $HYPR; do
  yay -S --needed --noconfirm "$pkg" ||
    printf "\n${R}Failed to install $pkg. Continuing without!${C}\n"
done
