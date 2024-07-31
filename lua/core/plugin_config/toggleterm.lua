-- ~/.config/nvim/init.lua or ~/.config/nvim/lua/config/toggleterm.lua

require("toggleterm").setup{
  size = 15,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '100',
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'shadow',
    winblend = 3,
    highlights = {
      border = "Normal",  -- Use the normal background for borders
      background = "Normal"  -- Use the normal background for the terminal
    },
  },
}

-- Keybinding for toggleterm

