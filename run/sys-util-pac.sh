#!/bin/bash

NC='\033[0m'
GREEN='\033[0;32m'
RED='\033[0;31m'

# System Utilities
SYSTEM_UTILS=(
  htop
  btop
  stow
  eza
  fastfetch
  zip
  unzip
  wget
  curl
  fzf
  kitty
  ghostty
  alacritty
  git
  bat
  neovim
  kate
  dolphin
  thunar
  google-chrome-canary
  obsidian
  gwenview
  flatpak
  libreoffice-still
  cliphist
  wl-clipboard
  rofi
  power-profiles-daemon
  light
  waybar
)

source ./utils.sh

printf "\n${GREEN}Installing System Utilities...${NC}/n"
install_packages "${SYSTEM_UTILS[@]}"
