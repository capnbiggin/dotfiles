local main_mod = "SUPER"

local monitors = hl.get_monitors()

hl.bind(main_mod .. " + SHIFT + M ", function()
  -- if monitors then
    for i, monitor in ipairs(monitors) do
      -- hl.notification.create({ text = 'Monitor ' .. i .. ' ' .. monitor.description, timeout = 15000 })
      hl.notification.create({ text = 'Monitor-' .. i .. ' ' .. monitor.name .. ' - desc:' .. monitor.description, timeout = 15000 })
    end
  -- end
end)

