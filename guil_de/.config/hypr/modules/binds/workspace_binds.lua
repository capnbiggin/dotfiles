-- Workspace Keybinds
local mod = "SUPER"

-- Switch workspaces with mod + [0-9]
-- Move active window to a workspace with mod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mod .. " + " .. key  , hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mod .. " + S"            , hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. " + SHIFT + S"    , hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mod + scroll
hl.bind(mod .. " + mouse_down"   , hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up"     , hl.dsp.focus({ workspace = "e-1" }))
