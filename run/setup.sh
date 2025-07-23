#!/bin/bash

NC='\033[0m'
GREEN='\033[0;32m'
RED='\033[0;31m'

# Exit on error
set -e

# Source Utility function
source ./utils.sh

# Source my package list
if [ ! -f "packages.conf" ]; then
  printf "\n${RED}ERROR: packages.conf not found!!${NC}\n"
  exit 1
fi

source packages.conf

# install the Arch User Repository helper yay.
. yay.sh

sleep 1

# Install all packages
printf "\n${GREEN}Installing System Utilities...${NC}/n"
install_packages "${SYSTEM_UTILS[@]}"

printf "\n${GREEN}Installing Dev Tools...${NC}\n"
install_packages "${DEV[@]}"

printf "\n$GREEN}Installing Fonts...${NC}\n"
install_packages "${FONTS[@]"

printf "\n${GREEN}Installing Media packages...${NC}\n"
install_packages "${MEDIA[@]}"

printf "\n${GREEN}Installing Network Packages...${NC}\n"
install_packages "${NETWORK[@]}"

# Enable Services
printf "\n${GREEN}Configuring services...${NC}\n"
for service in "${SERVICES[@]}"; do
  if ! systemctl is-enabled "$service" &>/dev/null; then
    printf "Enabling $service..."
    sudo systemctl enable "$service"
  else
    printf "n${GREEN}$service is already enabled${NC}\n"
  fi
done

# Sett up Z Shell
. zsh.sh

