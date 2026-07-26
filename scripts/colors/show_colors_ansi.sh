#!/usr/bin/env bash

clear='\033[0m'

fg=(
  # Regular colors
  "\033[1;107;30m"  # Black
  "\033[1;107;31m"  # Red
  "\033[1;107;32m"  # Green
  "\033[1;107;33m"  # Yellow
  "\033[1;107;34m"  # Blue
  "\033[1;107;35m"  # Magenta
  "\033[1;107;36m"  # Cyan
  "\033[1;107;37m"  # Light Gray
)
bright_fg=(
  # Bright colors
  "\033[1;47;90m"  # Bright Black (Gray)
  "\033[1;47;91m"  # Bright Red
  "\033[1;47;92m"  # Bright Green
  "\033[1;47;93m"  # Bright Yellow
  "\033[1;47;94m"  # Bright Blue
  "\033[1;47;95m"  # Bright Magenta
  "\033[1;47;96m"  # Bright Cyan
  "\033[1;47;97m"  # Bright White
)
bg=(
  # Background colors
  "\033[1;40m"  # Black
  "\033[1;41m"  # Red
  "\033[1;42m"  # Green
  "\033[1;43m"  # Yellow
  "\033[1;44m"  # Blue
  "\033[1;45m"  # Magenta
  "\033[1;46m"  # Cyan
  "\033[1;47m"  # White
)
bright_bg=(
  # Bright background colors
  "\033[1;100m"  # Bright Black (Gray)
  "\033[1;101m"  # Bright Red
  "\033[1;102m"  # Bright Green
  "\033[1;103m"  # Bright Yellow
  "\033[1;104m"  # Bright Blue
  "\033[1;105m"  # Bright Magenta
  "\033[1;106m"  # Bright Cyan
  "\033[1;107m"  # Bright White
)

mode="${1:-all}"

print_fg() {
  echo "== Fourground Colors 30-37 White BG 97 =="
  for i in ${fg[@]}; do
    printf "${i}%3s${clear}\n" "$i"
  done
  echo
}

print_bg() {
  echo "== Forground Colors as Backgrounds 40-47 =="
  for i in ${bg[@]}; do
    printf "${i}%3s ${clear}" "$i"
  done
  echo
  echo
}

print_bright_fg() {
  echo "== Bright Forground Colors 90-97 Light Gray BG 47 =="
  for i in ${bright_fg[@]}; do
    printf "${i}%3s${clear}\n" "$i"
  done
  echo
}

print_bright_bg() {
  echo "== Bright Forground Colors as Backgrounds 100-107 =="
  for bg in ${bright_bg[@]}; do
    printf "${bg}%3s ${clear}" "$bg"
  done
  echo
  echo
}

case "$mode" in
  reg) reg_col ;;
  fg) print_fg ;;
  bright_fg) print_bright_fg ;;
  bg) print_bg ;;
  bright_bg) print_bright_bg ;;
  all|*) print_fg; print_bright_fg; print_bg; print_bright_bg ;;
esac