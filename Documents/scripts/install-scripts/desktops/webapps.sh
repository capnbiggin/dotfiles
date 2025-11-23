#!/usr/bin/env bash

# Ensureing the application directory exist
mkdir -p ~/.local/share/applications

source ~/.local/bin/webapp-install "Google Messages" https://messages.google.com/web/conversations https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/google-messages.png
source ~/.local/bin/webapp-install "YouTube" https://youtube.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/youtube.png
source ~/.local/bin/webapp-install "GitHub" https://github.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/github-light.png
source ~/.local/bin/webapp-install "LastPass" https://lastpass.com/vault/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/lastpass.png

update-desktop-database ~/.local/share/applications
