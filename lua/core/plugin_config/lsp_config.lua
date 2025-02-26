vim.lsp.set_log_level("error")
--vim.lsp.log.set_path(vim.fn.stdpath('cache') .. '/lsp.log')

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {"lua_ls", "pylsp", "ruff", "clangd"}
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
end

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = on_attach
  },
})

require("lspconfig").lua_ls.setup{on_attach = on_attach}
require("lspconfig").clangd.setup{on_attach = on_attach}
require("lspconfig").ruff.setup{on_attach = on_attach}
require("lspconfig").html.setup{on_attach = on_attach}
require("lspconfig").cssls.setup{on_attach = on_attach}
require("lspconfig").asm_lsp.setup{on_attach = on_attach}
require("lspconfig").pylsp.setup{
  on_attach = on_attach,
  settings = {
    python = {
      pythonPath = '/usr/bin/python3', -- Adjust this path if you're using a virtual environment
    }
  }
}

