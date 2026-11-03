-- Monitors

hl.monitor({
  output   = "desc:LG Electronics LG ULTRAWIDE 0x000357A4",
  mode     = "2560x1080@59.98",
  position = "0x0",
  scale    = "1",
})

hl.monitor({
  output   = "eDP-2",
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

local monitors = hl.get_monitors()
local monitor_count = # (monitors)
local ws_per_mon = math.floor(10/monitor_count)
local ws_start = 1

for k, m in ipairs(monitors) do
  if k == 2 then
    ws_start = ws_per_mon + 1
  elseif k == 3 then
    ws_start = ws_per_mon + ws_per_mon + 1
  elseif k == 4 then
    ws_start = ws_per_mon + ws_per_mon + ws_per_mon + 1
  end
  for i = ws_start, k * ws_per_mon, 1 do
    hl.workspace_rule({ workspace = tostring(i), monitor = m.name, persistent = true, default = (i == 1) })
  end
end

-- Check attached Monitors
local main_mod = "SUPER"

hl.bind(main_mod .. " + SHIFT + M ", function()
  for i, monitor in ipairs(monitors) do
    hl.notification.create({ text = 'Monitor ' .. i .. '  ' .. monitor.name .. '\ndesc: ' .. monitor.description, timeout = 15000 })
  end
end)

-- workspaces devided by monitors rounded down
hl.bind(main_mod .. " + SHIFT + N ", function()
  local div = # (monitors)
  hl.notification.create({ text = tostring(math.floor(10/div)), timeout = 15000 })
end)
