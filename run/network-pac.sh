#!/bin/bash

NC='\033[0m'
GREEN='\033[0;32m'
RED='\033[0;31m'

# Network
NETWORK=(
  networkmanager
  nm-cnnection-editor
  network-manager-applet
  iwd
  iwgtk
)

source ./utils.sh

printf "\n${GREEN}Installing Network Packages...${NC}\n"
install_packages "${NETWORK[@]}"
