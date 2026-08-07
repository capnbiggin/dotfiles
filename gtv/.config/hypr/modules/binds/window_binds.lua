-- Window Layout Keybinds
local mod = "SUPER"

-- Move focus with mod + arrow keys
hl.bind(mod .. " + left"         , hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right"        , hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up"           , hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down"         , hl.dsp.focus({ direction = "down" }))
-- Move focus with mod + vim keys
hl.bind(mod .. " + H"            , hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + L"            , hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + K"            , hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + J"            , hl.dsp.focus({ direction = "down" }))

-- Scolling Layout binds
-- Move Window with H L or left right arrows
hl.bind(mod .. " + ALT + left"    , hl.dsp.layout("swapcol l"))
hl.bind(mod .. " + ALT + right"   , hl.dsp.layout("swapcol r"))
hl.bind(mod .. " + ALT + H"       , hl.dsp.layout("swapcol l"))
hl.bind(mod .. " + ALT + L"       , hl.dsp.layout("swapcol r"))

-- Column resizeing
hl.bind(mod .. " + SHIFT + left"  , hl.dsp.layout("colresize -conf"))
hl.bind(mod .. " + SHIFT + right" , hl.dsp.layout("colresize +conf"))
hl.bind(mod .. " + SHIFT + H"     , hl.dsp.layout("colresize -conf"))
hl.bind(mod .. " + SHIFT + L"     , hl.dsp.layout("colresize +conf"))
-- END Scrolling Layout binds

-- Move/resize windows with mod + LMB/RMB and dragging
hl.bind(mod .. " + mouse:272"    , hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273"    , hl.dsp.window.resize(), { mouse = true })
