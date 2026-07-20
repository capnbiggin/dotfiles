#!/usr/bin/env bash
#
# show_colors.sh — print terminal colors
#
# Usage:
#   ./show_colors.sh          # 16 basic colors (fg/bg) + 256-color palette
#   ./show_colors.sh basic    # only the 16 basic colors
#   ./show_colors.sh 256      # only the 256-color palette
#   ./show_colors.sh true     # 24-bit truecolor gradient (if your terminal supports it)

mode="${1:-all}"

print_basic() {
    echo "== Basic 16 colors (foreground on default / on black bg) =="
    for fg in {0..15}; do
        printf "\e[38;5;%sm%3s: sample text\e[0m\n" "$fg" "$fg"
    done
    echo
    echo "== Basic 16 colors as backgrounds =="
    for bg in {0..15}; do
        printf "\e[48;5;%sm%3s \e[0m " "$bg" "$bg"
        if (( (bg + 1) % 8 == 0 )); then echo; fi
    done
    echo
}

print_256() {
    echo "== 256-color palette =="
    for i in {0..255}; do
        printf "\e[48;5;%sm%3d\e[0m " "$i" "$i"
        if (( (i + 1) % 16 == 0 )); then echo; fi
    done
    echo
}

print_truecolor() {
    echo "== 24-bit truecolor gradient (requires truecolor-capable terminal) =="
    for ((i = 0; i < 76; i++)); do
        r=$(( 255 - (i * 255 / 75) ))
        g=$(( i * 2 * 255 / 75 % 256 ))
        b=$(( i * 255 / 75 ))
        printf "\e[48;2;%d;%d;%dm \e[0m" "$r" "$g" "$b"
    done
    echo
    echo
}

case "$mode" in
    basic) print_basic ;;
    256) print_256 ;;
    true) print_truecolor ;;
    all|*) print_basic; print_256; print_truecolor ;;
esac