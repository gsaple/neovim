return {

  -- nvim-treesitter {{{
  {
    "nvim-treesitter/nvim-treesitter",
    -- manually load TS
    -- a known issue seet https://github.com/nvim-treesitter/nvim-treesitter#i-experience-weird-highlighting-issues-similar-to-78
    -- note that treesitter can also be loaded when telescope is loaded
    cmd = "TSBufToggle",
    build = ":TSUpdate",
    dependencies = { "HiPhish/nvim-ts-rainbow2" },
    config = function()
      require("plugins.config.rainbow")
      require("plugins.config.treesitter")
    end,
  },
  -- }}}

  -- indentation line {{{
  {
    "lukas-reineke/indent-blankline.nvim",
    cmd = "IndentBlanklineToggle",
    config = function()
      require("plugins.config.indent_blankline")
    end,
  },
  -- }}}

  -- luasnip {{{
  -- loaded when cmp is loaded (required in cmp config)
  {
    "L3MON4D3/LuaSnip",
    version = "*",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("plugins.config.luasnip")
    end,
    --enabled = false,
  },
  -- }}}

  -- nvim-cmp {{{
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "f3fora/cmp-spell",
    },
    config = function()
      require("plugins.config.cmp")
    end,
  },
  -- }}}

  -- nvim-autopairs {{{
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("plugins.config.autopairs")
    end,
  },
  -- }}}

  -- nvim-colorizer {{{
  {
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = function()
      require("plugins.config.colorizer")
    end,
  },
  -- }}}

  -- telescope {{{
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    --cmd = "Telescope",
    keys = "l",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "ahmedkhalf/project.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = function()
      require("plugins.config.telescope")
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("projects")
    end,
  },
  -- }}}

  -- telescope-fzf-native {{{
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    enabled = vim.fn.executable("make") ~= 0,
    build = "make",
  },
  -- }}}

  -- playground {{{
  {
    "nvim-treesitter/playground",
    cmd = "TSHighlightCapturesUnderCursor",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  -- }}}

  -- which-key  {{{
  {
    "folke/which-key.nvim",
    keys = "l",
    config = function()
      require("plugins.config.which_key")
    end,
  },
  -- }}}

  -- nvim-tree {{{
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    --cmd = 'NvimTreeOpen',
    version = "*",
    config = function()
      require("plugins.config.nvim_tree")
    end,
  },
  -- }}}

  -- project {{{
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("plugins.config.project")
    end,
  },
  -- }}}

  -- vim-bbye {{{
  {
    "moll/vim-bbye",
    cmd = { "Bdelete", "Bwipeout" },
  },
  -- }}}

  -- vim-floaterm {{{
  {
    "voldikss/vim-floaterm",
    keys = "l",
    config = function()
      require("plugins.config.floaterm")
    end,
  },
  -- }}}

  -- vimtex {{{
  {
    "lervag/vimtex",
    -- lazyloading will break inverse search
    lazy = false,
    --ft = 'tex',
    config = function()
      vim.g.vimtex_mappings_enabled = 0
      vim.g.vimtex_complete_enabled = 0
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_quickfix_ignore_filters = {
        "Underfull \\\\hbox",
        "Overfull \\\\hbox",
      }
    end,
  },
  -- }}}

  -- mason.nvim {{{
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
  },
  -- }}}

  -- mason-lspconfig.nvim {{{
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("plugins.config.mason")
    end,
  },
  -- }}}

  -- nvim-lspconfig {{{
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    keys = "l",
    config = function()
      require("plugins.config.lsp")
    end,
  },
  -- }}}

  -- formatter.nvim {{{
  {
    event = { "CmdlineEnter" },
    "mhartington/formatter.nvim",
    config = function()
      require("plugins.config.formatter")
    end,
  },
  -- }}}

  -- Comment.nvim {{{
  {
    "numToStr/Comment.nvim",
    keys = "l",
    config = function()
      require("Comment").setup({
        toggler = {
          line = "gc",
          block = "gb",
        },
        mappings = {
          extra = false,
        },
      })
    end,
  },
  -- }}}
}
