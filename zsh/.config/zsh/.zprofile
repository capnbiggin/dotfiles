
# run startx on login from z shell
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
hyprland
fi

#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
#start-cosmic
#fi
