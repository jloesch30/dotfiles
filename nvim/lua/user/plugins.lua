vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- packer configuration
local use = require('packer').use
return packer.startup(function()
  use "nvim-lua/plenary.nvim"
  use "kyazdani42/nvim-tree.lua"
  use "kyazdani42/nvim-web-devicons"
  use { "wbthomason/packer.nvim" }
  use { "ellisonleao/gruvbox.nvim" }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
    "tamago324/nlsp-settings.nvim",
    "jose-elias-alvarez/null-ls.nvim"
  }
  -- cmp
  use {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    "saadparwaiz1/cmp_luasnip"
  }
  -- snippets
  use {
    "L3MON4D3/LuaSnip",
    "hrsh7th/vim-vsnip"

  }
  -- git
  use "lewis6991/gitsigns.nvim"
  -- colorschemes
  use "lunarvim/colorschemes"
end)