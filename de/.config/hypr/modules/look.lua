hl.config({
  general = {
    gaps_in          = 10,
    gaps_out         = 15,
    border_size      = 1,
    resize_on_border = true,
    allow_tearing    = false,

    col              = {
      active_border   = { colors = { "rgba(180, 190, 254, 1)", "rgba(180, 190, 254, 0.6)" }, angle = 45 },
      inactive_border = { colors = { "rgba(147, 153, 178, 1)", "rgba(147, 153, 178, 0.6)" }, angle = 45 },
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
      color        = "rgba(30, 30, 46, 0.45)",
      -- color        = "rgba(243, 139, 168, 1)", -- Test color
    },

    blur             = {
      enabled  = true,
      size     = 3,
      passes   = 1,
      vibrancy = 0.1696,
    },
  },
})
