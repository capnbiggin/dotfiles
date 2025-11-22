#!/usr/bin/env bash

NC='\033[0m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'

pushd ~

# Update the system first
printf "\n${YELLOW}Updating system...${NC}\n"
sudo pacman -Syu --noconfirm

# Install yay AUR helper if not present
if ! command -v yay &>/dev/null; then
  printf "\n${GREEN}Installing yay AUR helper...${NC}\n"
  sudo pacman -S --needed git base-devel --noconfirm
  if [[ ! -d "yay" ]]; then
    printf "\n${GREEN}Cloning yay repository...${NC}\n"
  else
    printf "\n${RED}yay directory already exists, removing it...${NC}\n"
    rm -rf yay
  fi

  git clone https://aur.archlinux.org/yay.git

  cd yay
  printf "\n${GREEN}building yay.... yaaaaayyyyy${NC}\n"
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
else
  printf "$\n{CYAN}yay is already installed${NC}\n"
fi

popd
