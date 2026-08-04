#!/usr/bin/env bash

G_PACKS=(
  cups
  cups-browsed
  cups-filters
  cups-pdf
  simple-scan
  sane
  sane-airscan
  curl
  tar
  wget
  git
  kate
  thunar
  obsidian
  gwenview
  flatpak
  light
  unzip
  zip
)

for pak in "${G_PACKS[@]}"; do
  yay -S --needed --noconfirm "$pak"
done

sudo systemctl enable --now cups.service
