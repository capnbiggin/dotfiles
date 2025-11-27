#!/usr/bin/env bash

SCRIPT_PATH=$HOME/Documents/scripts
ROFI_PATH=$HOME/.config/rofi

menu() {
  echo -e "$2" | rofi -dmenu -p "$1…"
}

terminal() {
  ghostty --class=capndot.menu -e bash -c "$1"
}

browser() {
  setsid google-chrome-stable --new-window --app="$1"
}

remove_menu() {
  case $(menu "Remove" "󰣇  Package\n  Web App") in
  *Package*) terminal "$SCRIPT_PATH"/pkg-remove.sh ;;
  *Web*) terminal "$SCRIPT_PATH"/webapp-remove.sh ;;
  *) main_menu ;;
  esac
}

install_menu() {
  case $(menu "Install" "󰣇  Package\n  Web App") in
  *Package*) terminal "$SCRIPT_PATH"/pkg-install.sh ;;
  *Web*) terminal "$SCRIPT_PATH"/webapp-install.sh ;;
  *) main_menu ;;
  esac
}

learn_menu() {
  case $(menu "Learn" " Keybindings\n  Hyprland\n󰣇  Arch\n  Neovim\n󱆃  Bash") in
  *Keybindings*) "$SCRIPT_PATH"/rofi-scripts/hypr-keybindings.sh ;;
  *Hyprland*) browser "https://wiki.hypr.land/" & ;;
  *Arch*) browser "https://wiki.archlinux.org/title/Main_page" & ;;
  *Bash*) browser "https://devhints.io/bash" & ;;
  *Neovim*) browser "https://www.lazyvim.org/keymaps" & ;;
  *) main_menu ;;
  esac
}

system_menu() {
  case $(menu "System" "  Lock\n󰤄  Suspend\n󰜉  Restart\n󰐥  Shutdown") in
  *Lock*) hyprlock ;;
  *Suspend*) systemctl suspend ;;
  *Restart*) systemctl reboot ;;
  *Shutdown*) systemctl poweroff ;;
  *) main_menu ;;
  esac
}

main_menu() {
  case $(menu "Start" " Apps\n󰉉  Install\n󰉉  Uninstall\n󰧑  Learn\n  System\n- About") in
  # *Apps*) rofi -show drun -show-icons -display-drun "Applications" ;;
  *Apps*) "$ROFI_PATH"/launchers/type-1/launcher.sh ;;
  *Install*) install_menu ;;
  *Uninstall*) remove_menu ;;
  *Learn*) learn_menu ;;
  *System*) system_menu ;;
  *About*) ghostty --class=capndot.menu --title=About -e bash -c 'fastfetch; read -n 1 -s' ;;
  esac
}

main_menu
