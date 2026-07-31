hl.config({
    general = {
        gaps_in          = 10,
        gaps_out         = 15,

        border_size      = 1,

        col              = {
            active_border   = { colors = { "rgba(7acfe4cc)", "rgba(8cd7aacc)" }, angle = 45 },
            inactive_border = "rgba(d9d7d6aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing    = false,

        layout           = "scrolling",
    },

    decoration = {
        rounding         = 10,
        rounding_power   = 3,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

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
})



-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
        column_width = 0.75,
        explicit_column_widths = "0.333, 0.5, 0.75, 1",
        follow_min_visible = 0.1,
        focus_fit_method = 1,
        wrap_focus = false,
        wrap_swapcol = false,
    },
})
