#!/usr/bin/env bash

NC='\033[0m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'

pushd ~

# Update the system first
echo -e "\n${YELLOW}Updating system...${NC}\n"
sudo pacman -Syu --noconfirm

# Install yay AUR helper if not present
if ! command -v yay &>/dev/null; then
  echo -e "\n${GREEN}Installing yay AUR helper...${NC}\n"
  sudo pacman -S --needed git base-devel --noconfirm
  if [[ ! -d "yay" ]]; then
    echo -e "\n${GREEN}Cloning yay repository...${NC}\n"
  else
    echo -e "\n${RED}yay directory already exists, removing it...${NC}\n"
    rm -rf yay
  fi

  git clone https://aur.archlinux.org/yay.git

  cd yay
  echo -e "\n${GREEN}building yay.... yaaaaayyyyy${NC}\n"
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
else
  echo -e "$\n${CYAN}yay is already installed${NC}\n"
fi

popd
