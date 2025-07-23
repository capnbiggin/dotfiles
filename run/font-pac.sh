
#!/bin/bash

NC='\033[0m'
GREEN='\033[0;32m'
RED='\033[0;31m'

# Fonts
FONTS=(
 ttf-jetbrains-mono-nerd
 ttf-font-awesome
 ttf-roboto
 noto-fonts
 noto-fonts-emoji
)


# Source Utility function
source ./utils.sh

printf "\n$GREEN}Installing Fonts...${NC}\n"
install_packages "${FONTS[@]"
