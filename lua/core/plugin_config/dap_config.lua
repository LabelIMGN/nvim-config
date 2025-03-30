local dap = require('dap')
local dapui = require('dapui')

-- Set up DAP UI
dapui.setup()

-- Connect DAP UI to DAP events
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Configure Python
require('dap-python').setup('python3')

-- Add keymaps for debugging
vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end, {desc = "Toggle Breakpoint"})
vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end, {desc = "Start/Continue Debug"})
vim.keymap.set('n', '<leader>ds', function() require('dap').step_over() end, {desc = "Step Over"})
vim.keymap.set('n', '<leader>di', function() require('dap').step_into() end, {desc = "Step Into"})
vim.keymap.set('n', '<leader>do', function() require('dap').step_out() end, {desc = "Step Out"})
vim.keymap.set('n', '<leader>dt', function() require('dap').terminate() end, {desc = "Terminate Debug"})
