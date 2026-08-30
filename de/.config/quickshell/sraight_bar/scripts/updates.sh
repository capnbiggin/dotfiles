#!/usr/bin/env bash

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
RESET='\033[0m'

HELPERS=(paru yay)
TIMEOUT=10

get_helper() {
    for helper in "${HELPERS[@]}"; do
        if command -v "$helper"; then
            HELPER="$helper"
            break
        fi
    done
}

check_updates() {
    if [[ -z "$HELPER" ]]; then
        echo -e "${RED}No package manager found. Please install one of the following: ${HELPERS[*]}${RESET}"
        return 0
    fi

    echo -e "${BLUE}Checking for updates using $HELPER...${RESET}"
    UPDATES=$($HELPER -Qu --aur --quiet | wc -l 2>/dev/null)
    if [[ -n "$UPDATES" ]]; then
        echo -e "${GREEN}Updates available:${RESET}"
        echo "$UPDATES"
    else
        echo -e "${GREEN}No updates available.${RESET}"
    fi
}

main() {
    get_helper
    check_updates
}

main
