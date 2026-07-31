-- Autostart with Hyprland

local appList = {
  "awww-daemon",
  "qs",
  "wl-paste --type text --watch cliphist store",
  "wl-paste --type image --watch cliphist store",
  "wl-clip-persist --clipboard regular",
  "/usr/lib/xdg-desktop-portal",
  "systemctl --user start hyprpolkitagent",
}

hl.on("hyprland.start", function ()
  for _, command in ipairs(appList) do
    hl.exec_cmd(command)
  end
end)
