#!/usr/bin/env bash

NETWORKS=(
  iwd
  iwgtk
  impala
)

for network in "${NETWORKS[@]}"; do
  yay -S --needed --noconfirm $network
done

sudo systemctl enable --now iwd

# Prevent systemd-networkd-wait-online timeout on boot
sudo systemctl disable systemd-networkd-wait-online.service
sudo systemctl mask systemd-networkd-wait-online.service
