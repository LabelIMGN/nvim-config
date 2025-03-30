-- React-Python project configuration

-- Set up frontend-specific keybindings
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.js", "*.jsx", "*.ts", "*.tsx"},
  callback = function()
    -- Start React development server
    vim.keymap.set('n', '<leader>rs', function()
      vim.cmd('split term://npm run start')
    end, {buffer = true, desc = "Start React Server"})
    
    -- Build React project
    vim.keymap.set('n', '<leader>rb', function()
      vim.cmd('split term://npm run build')
    end, {buffer = true, desc = "Build React Project"})
    
    -- Live preview (requires browser-sync or similar)
    vim.keymap.set('n', '<leader>rp', function()
      -- Check OS and use appropriate open command
      local os_name = vim.loop.os_uname().sysname
      if os_name == "Darwin" then -- macOS
        vim.cmd('!open http://localhost:3000')
      elseif os_name == "Linux" then
        vim.cmd('!xdg-open http://localhost:3000')
      elseif os_name:find("Windows") then
        vim.cmd('!start http://localhost:3000')
      else
        print("Unsupported OS for automatic browser opening")
      end
    end, {buffer = true, desc = "Preview React App"})
  end
})

-- Set up backend-specific keybindings
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.py"},
  callback = function()
    -- Run current Python file
    vim.keymap.set('n', '<leader>pr', function()
      vim.cmd('split term://python3 %')
    end, {buffer = true, desc = "Run Python File"})
    
    -- Start Python server (Flask/Django)
    vim.keymap.set('n', '<leader>ps', function()
      -- Check if we're in a Flask or Django project
      local is_flask = vim.fn.filereadable('app.py') == 1
      local is_django = vim.fn.filereadable('manage.py') == 1
      
      if is_flask then
        vim.cmd('split term://flask run')
      elseif is_django then
        vim.cmd('split term://python manage.py runserver')
      else
        print("Could not detect Flask or Django project")
      end
    end, {buffer = true, desc = "Start Python Server"})
  end
})
