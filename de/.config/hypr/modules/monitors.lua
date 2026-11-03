-- Monitors

hl.monitor({
  -- output   = "HDMI-A-1", 
  output   = "desc:LG Electronics LG ULTRAWIDE 0x000357A4",
  mode     = "2560x1080@59.98",
  position = "0x0",
  scale    = "1",
})

hl.monitor({
  -- output   = "eDP-2",
  output   = "desc:AU Optronics 0x3CA2",
  mode     = "2560x1600@240.02",
  position = "0x1080",
  scale    = "1.6",
})

hl.monitor({
  output   = "",
  mode     = "preferred",
  position = "auto",
  scale    = "1",
})

--[[
  workspaces to display per monitor
  last monitor get the left over workspaces after equal division of the 10 workspaces
--]]
local monitors = hl.get_monitors()
for k, m in ipairs(monitors) do
  local ws_per_mon = math.floor(10/ # (monitors))
  local ws_start = 1
  if k > 1 then
    ws_start = (k - 1) * ws_per_mon + 1
  end
  for i = ws_start, 10, 1 do
    hl.workspace_rule({ workspace = tostring(i), monitor = m.name, persistent = true, default = (i == 1) })
  end
end

--  Keybind to check attached Monitors info
local main_mod = "SUPER"

hl.bind(main_mod .. " + SHIFT + M ", function()
  for i, monitor in ipairs(monitors) do
    hl.notification.create({ text = 'Monitor ' .. i .. '  ' .. monitor.name .. '\ndesc: ' .. monitor.description .. '\nscale: ' .. monitor.scale, timeout = 15000 })
  end
end)

-- keybind to check workspaces devided by monitors rounded down
hl.bind(main_mod .. " + SHIFT + N ", function()
  local div = # (monitors)
  hl.notification.create({ text = tostring(math.floor(10/div)), timeout = 15000 })
end)
