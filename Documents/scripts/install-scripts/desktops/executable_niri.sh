#!/usr/bin/env bash

sudo pacman -Syu niri xwayland-satellite xdg-desktop-portal-gnome xdg-desktop-portal-gtk
paru -S matugen wl-clipboard cliphist cava qt6-multimedia-ffmpeg
systemctl --user add-wants niri.service dms
