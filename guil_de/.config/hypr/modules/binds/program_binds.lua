-- Progrem Keybinds

local mod           = "SUPER"

local terminal1     = "ghostty"
local terminal2     = "kitty"
local browser1      = "zen-browser || zen"
local fileManager   = "thunar"
local notes1        = "obsidian"
local notes2        = "zennotes"
local editor1       = "code"
local editor2       = "zeditor"
local editor3       = "codium"
local bar_toggle    = "pkill quickshell || quickshell"


hl.bind(mod .. " + RETURN"       , hl.dsp.exec_cmd(terminal1))
hl.bind(mod .. " + ALT + RETURN" , hl.dsp.exec_cmd(terminal2))
hl.bind(mod .. " + W"            , hl.dsp.exec_cmd(browser1))
hl.bind(mod .. " + E"            , hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + O"            , hl.dsp.exec_cmd(notes1))
hl.bind(mod .. " + SHIFT + O"    , hl.dsp.exec_cmd(notes2))
hl.bind(mod .. " + I"            , hl.dsp.exec_cmd(editor1))
hl.bind(mod .. " + SHIFT + I"    , hl.dsp.exec_cmd(editor2))
hl.bind(mod .. " + ALT + I"      , hl.dsp.exec_cmd(editor2))
hl.bind(mod .. " + B"            , hl.dsp.exec_cmd(bar_toggle))

hl.bind("ALT + RETURN"           , hl.dsp.exec_cmd(terminal1))
