vim.keymap.set("n", "<c-n>", ":NvimTreeToggle<CR>", {desc="Open Parent Directory in Nvim-tree"})
vim.keymap.set("n", "<c-,>", ":Oil --float<CR>", {desc="Open Parent Directory in Nvim-tree"})

vim.keymap.set("n", "nn", "<cmd>tabnew<CR>", {desc="opens tabpage after the current one"})

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Moving through pains
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')



-- Hightlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})


