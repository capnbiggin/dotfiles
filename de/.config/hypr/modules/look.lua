hl.config({
  general = {
    gaps_in          = 10,
    gaps_out         = 15,
    border_size      = 1,
    resize_on_border = true,
    allow_tearing    = false,

    col              = {
      active_border   = {
        colors = { "rgba(" .. Colors.cyan.hex:sub(2) .. "cc)", "rgba(" .. Colors.blue.hex:sub(2) .. "cc)" },
        angle = 45
      },
      inactive_border = {
        colors = { Colors.grey0.hex, "rgba(" .. Colors.grey0.hex:sub(2) .. "cc)" },
        angle = 45
      },
    },
  },

  decoration = {
    rounding         = 16,
    rounding_power   = 5,

    active_opacity   = 1.0,
    inactive_opacity = 0.99,

    shadow           = {
      enabled      = true,
      range        = 15,
      render_power = 3,
      color        = "rgba(" .. Colors.bg1.hex:sub(2) .. "cc)",
      -- color        = "rgba(243, 139, 168, 1)", -- Test color
    },

    blur             = {
      enabled  = true,
      size     = 5,
      passes   = 2,
      vibrancy = 0.1696,
    },
  },
})
