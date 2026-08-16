#!/usr/bin/env bash

source "./colors.sh"

# Logging functions
log_info() {
  echo -e "\n${FG_BLUE}[INFO]${NC} $1"
}

log_success() {
  echo -e "\n${FG_GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
  echo -e "\n${FG_YELLOW}[WARNING]${NC} $1"
}

log_error() {
  echo -e "\n${FG_RED}[ERROR]${NC} $1"
}

# Exit immediately if a command exits with a non-zero status
set -e

catch_errors() {
  log_error "\nCapndot installation failed!\n"
}
trap catch_errors ERR
