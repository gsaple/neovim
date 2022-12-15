return require('packer').startup(function(use)

  -- packer itself {{{
  use 'wbthomason/packer.nvim'
  -- }}}

  -- dev icons {{{
  use {
    "kyazdani42/nvim-web-devicons",
     module = "nvim-web-devicons",
     config = function()
       require('plugins.config').webicon()
     end,
  }
  -- }}}

  -- plenary {{{
  use {
    "nvim-lua/plenary.nvim",
    module = "plenary",
  }
  -- }}}

  -- nvim-treesitter {{{
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require('plugins.config').treesitter()
    end,
    -- manually load TS
    -- a known issue seet https://github.com/nvim-treesitter/nvim-treesitter#i-experience-weird-highlighting-issues-similar-to-78
    cmd = "TSBufToggle",
  }
  -- }}}

  -- ts-rainbow {{{
  use {
    "p00f/nvim-ts-rainbow",
    after = "nvim-treesitter",
  }
  -- }}}

  -- indentation line {{{
  use {
    "lukas-reineke/indent-blankline.nvim",
    --after = "nvim-treesitter",
    cmd = "IndentBlanklineToggle",
    tag = "v2.20.2",
    config = function()
      require('plugins.config').indent_blankline()
    end,
  }
  -- }}}

  -- luasnip {{{
  use {
    "L3MON4D3/LuaSnip",
    module = "luasnip",
    tag = "v1.1.0",
    config = function()
      require('plugins.config').luasnip()
    end,
    --disable = true,
  }
  -- }}}

  -- snippets collections {{{
  use {
    "rafamadriz/friendly-snippets",
    after = "nvim-cmp",
  }
  -- }}}

  -- nvim-cmp {{{
  use {
    "hrsh7th/nvim-cmp",
    event = { 'InsertEnter', 'CmdlineEnter' },
    requires = {
      { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
      { "f3fora/cmp-spell", after = "nvim-cmp" }
    },
    config = function()
      require('plugins.config').cmp()
    end,
  }
  -- }}}

  -- nvim-autopairs {{{
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require('plugins.config').autopairs()
    end,
  }
  -- }}}

  -- nvim-colorizer {{{
  use {
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = function()
      require('plugins.config').colorizer()
    end,
  }
  -- }}}

  -- telescope {{{
  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    cmd = "Telescope",
    module = "telescope",
    config = function()
      require('plugins.config').telescope()
    end,
  }
  -- }}}

  -- telescope-fzf-native.nvim {{{
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    after = "telescope.nvim",
    disable = vim.fn.executable "make" == 0,
    run = "make",
    config = function() require("telescope").load_extension "fzf" end,
  }
  -- }}}

  -- playground {{{
  use {
    "nvim-treesitter/playground",
    after = "nvim-treesitter"
  }
  -- }}}
end)
