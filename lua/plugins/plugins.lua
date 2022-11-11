return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- nvim-treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    run = ":TSUpdate",
    config= function()
      require('plugins.config').treesitter()
    end,
  }

  -- colour scheme
  use {
    "sainnhe/gruvbox-material",
    after= "nvim-treesitter",
    config = function()
       require('plugins.config').gruv()
    end,
  }

  -- statusline
  use {
    "itchyny/lightline.vim",
    after = "gruvbox-material",
    config = function()
      require('plugins.config').lightline()
    end,
  }

  -- dev icons
  use {
    "kyazdani42/nvim-web-devicons",
     module = "nvim-web-devicons",
     config = function()
       require('plugins.config').webicon()
     end,
  }

  -- luasnip
  use {
    "L3MON4D3/LuaSnip",
    event = "BufReadPre",
    config = function()
      require('plugins.config').luasnip()
    end,
  }

  -- nvim-cmp
  use {
    "hrsh7th/nvim-cmp",
    event = "BufReadPre",
    requires = {
      {"hrsh7th/cmp-buffer", after = "nvim-cmp"},
      {"hrsh7th/cmp-path", after = "nvim-cmp"},
      {"hrsh7th/cmp-cmdline", after = "nvim-cmp"},
    },
    config = function()
      require('plugins.config').cmp()
    end,
  }
end)
