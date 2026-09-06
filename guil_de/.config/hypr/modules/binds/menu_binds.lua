-- Menu Keybinds
local mod           = "SUPER"

local menu          = "~/.config/rofi/launchers/launcher-1.sh"
local capn_menu     = "~/.config/rofi/scripts/capn-menu.sh"
local power_menu    = "~/.config/rofi/scripts/capn-menu.sh power"
local wallpaper     = "~/.config/rofi/scripts/wallpapers.sh"
local cliphist      = "cliphist list | rofi -dmenu | cliphist decode | wl-copy"

hl.bind(mod .. " + ALT + SPACE"  , hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + SHIFT + SPACE", hl.dsp.exec_cmd(capn_menu))
hl.bind(mod .. " + CTRL + SPACE" , hl.dsp.exec_cmd(power_menu))
hl.bind(mod .. " + CTRL + W"     , hl.dsp.exec_cmd(wallpaper))
hl.bind(mod .. " + C"            , hl.dsp.exec_cmd(cliphist))
