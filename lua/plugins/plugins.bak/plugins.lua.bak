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
    --tag = "0.1.0",
    cmd = "Telescope",
    module = "telescope",
    config = function()
      require('plugins.config').telescope()
    end,
  }
  -- }}}

  -- telescope-fzf-native {{{
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

  -- which-key  {{{
  use {
    "folke/which-key.nvim",
    keys = "<leader>",
    config = function()
      require('plugins.config').which_key()
    end,
  }
  -- }}}

  -- nvim-tree {{{
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    cmd = 'NvimTreeToggle',
    tag = 'nightly',
    config = function()
      require('plugins.config').nvim_tree()
    end,
  }
  -- }}}

  -- bufferline {{{
  use {
    "akinsho/bufferline.nvim",
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    event = "BufReadPre",
    tag = "v3.*",
    config = function()
      require('plugins.config').bufferline()
    end,
  }
  -- }}}

  -- project {{{
  use {
    "ahmedkhalf/project.nvim",
    -- notes: this module should be loaded before telescope for integration
    after = "which-key.nvim",
    config = function()
      require('telescope').load_extension('projects')
      require('plugins.config').project()
    end,
  }
  -- }}}

  -- vim-bbye {{{
  use {
    "moll/vim-bbye",
    cmd = { "Bdelete", "Bwipeout" },
  }
  -- }}}

  -- toggleterm {{{
  use {
    "akinsho/toggleterm.nvim",
    tag = '*',
    cmd = "ToggleTerm",
    config = function()
      require('plugins.config').toggleterm()
    end
  }
-- }}}

  -- vimtex {{{
  use {
    "lervag/vimtex",
    -- lazyloading will break inverse search
    --ft = 'tex',
    config = function()
      require('plugins.config').vimtex()
    end
  }
  -- }}}

end)
