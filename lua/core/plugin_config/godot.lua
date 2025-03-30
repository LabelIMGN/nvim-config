-- Updated lua/core/plugin_config/godot.lua

-- Function to safely execute Godot commands
local function safe_cmd(cmd)
  local status, _ = pcall(function() vim.cmd(cmd) end)
  if not status then
    vim.notify("Command not available: " .. cmd, vim.log.levels.WARN)
  end
end

-- Function to connect to the Godot editor
local function godot_connect()
  safe_cmd("GodotConnect 127.0.0.1 6005")
  print("Attempted to connect to Godot editor")
end

-- Function to run the current scene in Godot
local function godot_run_scene()
  safe_cmd("GodotRunCurrent")
  print("Attempted to run current scene in Godot")
end

-- Set up keybindings
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"gdscript", "gdscript3", "gd"},
  callback = function()
    -- Connect to Godot
    vim.keymap.set('n', '<leader>gc', godot_connect, {buffer = true, desc = "Connect to Godot"})
    -- Run current scene
    vim.keymap.set('n', '<leader>gr', godot_run_scene, {buffer = true, desc = "Run current scene"})
    -- Format (only if available)
    vim.keymap.set('n', '<leader>gf', function() safe_cmd("GodotGdformat") end, {buffer = true, desc = "Format GDScript"})
  end
})

-- Set file-specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"gdscript", "gdscript3", "gd"},
  callback = function()
    -- 4-space indentation for GDScript
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.expandtab = false

    -- Do NOT enable auto-formatting for now, since it's causing errors
    -- We'll add a safer version below
  end
})

-- Safer auto-formatting that checks if command exists
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*.gd", "*.gdscript"},
  callback = function()
    -- Check if the GodotGdformat command exists before trying to run it
    local command_exists = vim.fn.exists(":GodotGdformat") == 2
    if command_exists then
      vim.cmd("GodotGdformat")
    end
  end
})

-- Godot project detection
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"project.godot", "*.gd", "*.tscn", "*.tres", "*.import"},
  callback = function()
    vim.bo.filetype = "gdscript"
    -- print("Godot file detected")
  end
})
