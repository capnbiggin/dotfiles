#!/bin/bash

NC='\033[0m'
GREEN='\033[0;32m'
RED='\033[0;31m'

# Services
SERVICES=(
  NetworkManager
)
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
