vim.opt.number = true             -- Show line numbers
vim.opt.relativenumber = true     -- Show relative line number

-- TAB configuration
vim.opt.expandtab = true          -- Convert tabs to spaces
vim.opt.shiftwidth = 4            -- Amount to indent with << and >>
vim.opt.tabstop = 4               -- How many spaces are shown per Tab
vim.opt.softtabstop = 4           -- How many spaces are applied when pressing Tab

-- Indent configuration
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true         -- Keep identation from previous line
vim.opt.breakindent = true        -- Enable break indent

vim.opt.cursorline = true         -- Show line under cursor

vim.opt.undofile = true           -- Store undos between sessions

vim.opt.mouse = 'a'               -- Enable mouse mode, can be useful for resizing splits for example!

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"         -- Keep signcolumn on by default

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
