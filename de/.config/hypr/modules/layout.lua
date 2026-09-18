hl.config({
  general = {
    layout = "scrolling",
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

  monocle = {

  },
})
