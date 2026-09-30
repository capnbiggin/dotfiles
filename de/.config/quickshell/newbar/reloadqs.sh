#!/usr/bin/env bash

# --------------------------------------------------------------------- #
# This script is used to reload the QuickShell configuration. 
# It is called by the "Reload QuickShell" action in the QuickShell menu.
# --------------------------------------------------------------------- #


# Get the path to the QuickShell configuration file
QS_SHELL="$(dirname "$(realpath "$0")")"

pkill quickshell

sleep 1

quickshell -p "$QS_SHELL" &