#!/bin/bash/

NC='\033[0m'
GREEN='\033[0;32m'
RED='\033[0;31m'

# Exit on error
set -e

# Source Utility function
source utils.sh

# Source my package list
if [ ! -f "packages.conf" ]; then
  printf "${RED}ERROR: packages.conf not found!!${NC}"
  exit 1
fi

source packages.conf

# install the Arch User Repository helper yay.
. yay.sh

sleep 1

# Install all packages
printf "${GREEN}Installing System Utilities...${NC}"
install_packages "${SYSTEM_UTILS[@]}"

printf "${GREEN}Installing Dev Tools...${NC}"
install_packages "${DEV[@]}"

printf "$GREEN}Installing Fonts...${NC}"
install_packages "${FONTS[@]"

printf "${GREEN}Installing Media packages...${NC}"
install_packages "${MEDIA[@]}"

printf "${GREEN}Installing Network Packages...${NC}"
install_packages "${NETWORK[@]}"

# Enable Services
printf "${GREEN}Configuring services...${NC}"
for service in "${SERVICES[@]}"; do
  if ! systemctl is-enabled "$service" &>/dev/null; then
    printf "Enabling $service..."
    sudo systemctl enable "$service"
  else
    printf "$service is already enabled"
  fi
done

# Sett up Z Shell
. zsh.sh

