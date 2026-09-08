hl.config({
  general = {
    gaps_in          = 10,
    gaps_out         = 15,
    border_size      = 1,
    resize_on_border = true,
    allow_tearing    = false,
    layout           = "scrolling",

    col              = {
      active_border   = { colors = { "rgb(b4befe)", "rgba(b4befe99)" }, angle = 45 },
      inactive_border = { colors = { "rgb(9399b2)", "rgba(9399b299)" }, angle = 45 },
      -- inactive_border = "rgb(9399b2)",
    },
  },

  decoration = {
    rounding         = 10,
    rounding_power   = 3,

    active_opacity   = 1.0,
    inactive_opacity = 0.99,

    shadow           = {
      enabled      = true,
      range        = 4,
      render_power = 3,
      color        = 0xee1a1a1a,
    },

    blur             = {
      enabled  = true,
      size     = 3,
      passes   = 1,
      vibrancy = 0.1696,
    },
  },

  animations = {
    enabled = true,
  },

  -- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
  scrolling = {
    fullscreen_on_one_column = true,
    column_width = 0.75,
    explicit_column_widths = "0.333, 0.5, 0.75, 1",
    follow_min_visible = 0.1,
    focus_fit_method = 1,
    wrap_focus = false,
    wrap_swapcol = false,
  },

  -- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
  master = {
    new_status = "master",
  },

  -- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
  dwindle = {
    preserve_split = true, -- You probably want this
  },
})
