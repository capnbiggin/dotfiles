#!/bin/bash

theme="$HOME/.config/rofi/config.rasi"

networkmanager_dmenu -i -p "Network:" \
		  -theme ${theme}
