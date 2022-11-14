return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- nvim-treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    run = ":TSUpdate",
    config = function()
      require('plugins.config').treesitter()
    end,
  }

  -- indentation line
  use {
    "lukas-reineke/indent-blankline.nvim",
    after = "nvim-treesitter",
    tag = "v2.20.2",
    config = function()
      require('plugins.config').indent_blankline()
    end,
  }

  -- colour scheme
  use {
    "sainnhe/gruvbox-material",
    after = "nvim-treesitter",
    config = function()
       require('plugins.config').gruv()
    end,
  }

  -- statusline
  use {
    "nvim-lualine/lualine.nvim",
    after = "gruvbox-material",
    config = function()
      require('plugins.config').lualine()
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
    tag = "v1.1.0",
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

  -- nvim-autopairs
  use {
    "windwp/nvim-autopairs",
    event = "BufReadPre",
    config = function()
      require('plugins.config').autopairs()
    end,
  }

end)
