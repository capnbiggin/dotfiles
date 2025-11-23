#!/usr/bin/env bash
INSTALL_DIR=$HOME/Documents/scripts/install-scripts

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[96m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
  echo -e "\n${BLUE}[INFO]${NC} $1"
}

log_success() {
  echo -e "\n${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
  echo -e "\n${YELLOW}[WARNING]${NC} $1"
}

log_error() {
  echo -e "\n${RED}[ERROR]${NC} $1"
}

# Exit immediately if a command exits with a non-zero status
set -e

catch_errors() {
  log_error "\nCapndot installation failed!\n"
  log_info "\nYou can retry by running: bash $INSTALL_DIR/install.sh\n"
}

trap catch_errors ERR

# Must not be running as root
if [ "$EUID" -eq 0 ]; then
  log_warning "\nDo not run this script as root!!\n"
  exit 1
fi

show_logo() {
  clear
  echo -e "$CYAN"
  cat <"$INSTALL_DIR"/logo.txt
  echo -e "$NC"
}

sudo pacman -Syyu --noconfirm --needed

show_logo
