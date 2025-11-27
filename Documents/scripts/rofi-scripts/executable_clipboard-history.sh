#!/usr/bin/env bash

cliphist list | rofi -dmenu -theme ~/.config/rofi/launchers/type-1/style-1.rasi -p " Clipboard History" | cliphist decode | wl-copy
