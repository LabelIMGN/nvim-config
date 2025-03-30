-- Arduino Configuration

-- Set up file detection for Arduino
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"*.ino", "*.pde"},
  callback = function()
    -- Set the filetype to cpp since Arduino is based on C++
    vim.bo.filetype = "cpp"
    vim.notify("Arduino file detected - using C++ support", vim.log.levels.INFO)
  end
})

-- Set up Arduino-specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"cpp"},
  callback = function()
    -- Only apply to .ino files
    local filename = vim.fn.expand("%:e")
    if filename == "ino" or filename == "pde" then
      -- Set indentation for Arduino files
      vim.opt_local.tabstop = 2
      vim.opt_local.softtabstop = 2
      vim.opt_local.shiftwidth = 2
      vim.opt_local.expandtab = true
      
      -- -- Add keybinding for your custom upload script
      -- vim.keymap.set('n', '<leader>au', function()
      --   vim.cmd('split | terminal /path/to/your/upload-script.sh ' .. vim.fn.expand("%:p"))
      -- end, {buffer = true, desc = "Arduino: Upload"})
    end
  end
})
