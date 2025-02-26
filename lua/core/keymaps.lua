-- Core mapping
local opts = { noremap = true, silent = true }
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -5<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +5<CR>', opts)
vim.keymap.set('n', '<C-Up>', ':wincmd = <CR>', opts)
vim.keymap.set('n', '<C-Down>', ':vertical resize +90<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<C-r>', ':w<CR>:!python3 %<CR>', opts)

vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
-- Function to move selected lines down
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- Add to lua/core/keymaps.lua
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, {desc = "Show diagnostics", noremap = true, silent = true})

-- REMAPS
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)

