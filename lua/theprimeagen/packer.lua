-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use "EdenEast/nightfox.nvim" -- Packer	
  use(
  "nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"}
)
	use('nvim-treesitter/playground')
	use('ThePrimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use('neovim/nvim-lspconfig')
	use {
  "williamboman/mason.nvim", -- installer
  run = ":MasonUpdate"
}

use {
  "williamboman/mason-lspconfig.nvim",
  requires = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
}

use {
  "RRethy/vim-illuminate",
  config = function()
    require("illuminate").configure({
      providers = { "lsp", "treesitter" },
      delay = 50,
      under_cursor = false,
    })
  end
}

use { "mfussenegger/nvim-dap" }
use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }


-- Autocompletion plugins
use {
  "hrsh7th/nvim-cmp",
  requires = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "onsails/lspkind.nvim", -- (optional) pretty completion
    "L3MON4D3/LuaSnip",      -- snippet engine
  }
}
  end)

