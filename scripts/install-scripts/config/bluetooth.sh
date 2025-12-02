#!/usr/bin/env bash

source "$HOME/Documents/scripts/script-beginer.sh"

log_info "\nInstalling bluberry Bluetooh controls\n"
yay -S --noconfirm --needed bluberry

log-info "\nTurning on bluetooth servise by default\n"
sudo systemctl enable --now bluetooth
