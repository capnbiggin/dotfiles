-- Progrem Keybinds

local mod           = "SUPER"

local terminal      = "ghostty"
local browser1      = "zen-browser"
local fileManager   = "thunar"
local notes1        = "obsidian"
local notes2        = "zennotes"
local editor1       = "code"
local editor2       = "zeditor"
local bar_toggle    = "pkill qs || qs"


hl.bind(mod .. " + RETURN"       , hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + W"            , hl.dsp.exec_cmd(browser1))
hl.bind(mod .. " + E"            , hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + O"            , hl.dsp.exec_cmd(notes1))
hl.bind(mod .. " + SHIFT + O"    , hl.dsp.exec_cmd(notes2))
hl.bind(mod .. " + I"            , hl.dsp.exec_cmd(editor1))
hl.bind(mod .. " + SHIFT + I"    , hl.dsp.exec_cmd(editor2))
hl.bind(mod .. " + B"            , hl.dsp.exec_cmd(bar_toggle))
