#!/bin/bash

# Arch needs `yay -S pacman-contrib` to run

cupd=$(checkupdates | wc -l)
sleep 2
echo " $cupd"
