#!/bin/bash

NC='\033[0m'
GREEN='\033[0;32m'
RED='\033[0;31m'

# DEV
DEV=(
  python
  python3
  python-pip
  python-gobject
  python3-gobject
  python-screeninfo
)
source ./utils.sh

printf "\n${GREEN}Installing Dev Tools...${NC}\n"
install_packages "${DEV[@]}"
