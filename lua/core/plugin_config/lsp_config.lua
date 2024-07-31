vim.lsp.set_log_level("debug")
--vim.lsp.log.set_path(vim.fn.stdpath('cache') .. '/lsp.log')

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {"lua_ls", "pyright", "clangd"}
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
end

require("lspconfig").lua_ls.setup{on_attach = on_attach}
require("lspconfig").clangd.setup{on_attach = on_attach}
require("lspconfig").pyright.setup{
  on_attach = on_attach,
  settings = {
    python = {
      pythonPath = '/usr/bin/python3', -- Adjust this path if you're using a virtual environment
    }
  }
}
