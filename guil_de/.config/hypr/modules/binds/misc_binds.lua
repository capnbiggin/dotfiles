-- Misalanus Keybinds
local mod = "SUPER"

local capture       = "~/.local/bin/screencap"
local hypr_reload   = "~/.local/bin/hypr_reload"

-- screencap
hl.bind(mod .. " + SHIFT + C"    , hl.dsp.exec_cmd(capture))

-- QUIT
hl.bind(mod .. " + Q"            , hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + Q"    ,
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Toggle Float
hl.bind(mod .. " + F"            , hl.dsp.window.float({ action = "toggle" }))
-- hl.bind(mod .. " + P"         , hl.dsp.window.pseudo())
-- hl.bind(mod .. " + J"         , hl.dsp.layout("togglesplit")) -- dwindle only

-- Reload hyprland Config
hl.bind(mod .. " + R"            , hl.dsp.exec_cmd(hypr_reload))
