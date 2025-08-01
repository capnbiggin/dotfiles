
# Wallpaper Starter
~/.fehbg &

# start picom
picom  &

# start slstatus
slstatus &

# start greenclip
greenclip daemon &

# dwm restart loop
while true; do
    dwm >/dev/null 2>&1
done

# dwm start
exec dwm

