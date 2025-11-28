#!/usr/bin/env bash

source "$HOME/Documents/scripts/script-beginer.sh"

log_info "\nInstalling Niri\n"
sudo pacman -Syu niri xwayland-satellite xdg-desktop-portal-gnome xdg-desktop-portal-gtk imv
yay -S matugen wl-clipboard cliphist cava qt6-multimedia-ffmpeg

log_info "\nEnabling niri service\n"
systemctl --user add-wants niri.service
