local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup() end}
  use 'kylechui/nvim-surround'
use { "nvim-neotest/nvim-nio" }
  use 'windwp/nvim-autopairs'
  use 'ellisonleao/gruvbox.nvim'
  use "rebelot/kanagawa.nvim"
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'preservim/vim-pencil'
  use 'nvim-treesitter/nvim-treesitter'
use 'lukas-reineke/indent-blankline.nvim'
 -- Add these inside your packer startup function
use 'mfussenegger/nvim-dap'                   -- Debug adapter
use 'mfussenegger/nvim-dap-python'            -- Python debug adapter
use 'rcarriga/nvim-dap-ui'                    -- UI for debugging
use 'jose-elias-alvarez/null-ls.nvim'         -- For linting/formatting
use 'jose-elias-alvarez/typescript.nvim'      -- TypeScript/React tools
use 'MunifTanjim/prettier.nvim'               -- Prettier formatter
use 'pmizio/typescript-tools.nvim'            -- TypeScript code actions use 'lukas-reineke/indent-blankline.nvim'
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
  use {'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', {'neovim/nvim-lspconfig', tag = 'v1.5.0'}}
  use 'simrat39/rust-tools.nvim'
  -- Completion framework:
  use 'hrsh7th/nvim-cmp'

  -- LSP completion source:
  use 'hrsh7th/cmp-nvim-lsp'

  -- GODOT
  use 'habamax/vim-godot'  -- Enhanced Godot/GDScript support
  use {
  'ldelossa/litee.nvim',  -- Creates a VS Code-like panel for project symbols
  requires = { {'ldelossa/litee-symboltree.nvim'} }
  }
  use 'cdelledonne/vim-cmake'  -- For building Godot projects with C#/C++ components

  -- Useful completion sources:
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/vim-vsnip'
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
