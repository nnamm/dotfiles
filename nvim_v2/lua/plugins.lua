local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'shaunsingh/nord.nvim'

  use 'hoob3rt/lualine.nvim' -- Statusline
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'akinsho/nvim-bufferline.lua'
  use 'norcalli/nvim-colorizer.lua'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({with_sync = true})
    end
  }
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'onsails/lspkind-nvim' -- vscode-like pictograms

  use 'neovim/nvim-lspconfig' -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'hrsh7th/cmp-path' -- nvim-cmp source for paths
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'L3MON4D3/LuaSnip' -- Snippet
  use 'saadparwaiz1/cmp_luasnip' -- Completion for LuaSnip
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browser
  use 'mattn/vim-sonictemplate'
  use {'phaazon/hop.nvim', branch = 'v2'}
  use 'terrortylor/nvim-comment'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end
  })
end)
