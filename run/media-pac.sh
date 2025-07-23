#!/bin/bash

NC='\033[0m'
GREEN='\033[0;32m'
RED='\033[0;31m'

# Media
MEDIA=(
  flameshot
  gimp
  vlc
  pipwire
  lib32-pipwire
  pipewire-pulse
  pavucontrol
  pwvucontrol
  swww
  waypaper
  matugen
  wallust
  #feh
)

source ./utils.sh

printf "\n${GREEN}Installing Media packages...${NC}\n"
install_packages "${MEDIA[@]}"
