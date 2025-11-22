#!/usr/bin/env bash

# Install Bluetooh controls
yay -S --noconfirm --needed bluberry

# Turn on bluetooth servise by default
sudo systemctl enable --now bluetooth
