local M = {}

-- gruvbox_material scheme
M.colour_scheme = function()
  vim.g.gruvbox_material_ui_contrast = 'high'
  local ok, _ = pcall(vim.cmd, 'colorscheme gruvbox-material')
  if not ok then
    return
  end
end

-- lightline
M.lightline = function()
  local ok, _ = pcall(vim.cmd, [[let g:lightline = {'colorscheme' : 'gruvbox_material'}]])
  if not ok then
    return
  end
end

-- web dev icon
M.webicon = function()
  local ok, icon = pcall(require, 'nvim-web-devicons')
  if not ok then
    return
  end
  icon.setup {
    default = true,
  }
end

-- luasnip
M.luasnip = function()
  local ok, luasnip = pcall(require, 'luasnip')
  if not ok then
    return
  end
  require('luasnip.loaders.from_lua').load({paths = '~/.config/nvim/lua/snippets/'})
  require("luasnip").config.set_config {
    enable_autosnippets = true,
    update_events = 'TextChanged,TextChangedI',
    region_check_events = 'InsertEnter',
  }
  vim.cmd([[imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' ]])
  vim.cmd([[smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>']])
  vim.cmd([[imap <silent><expr> <C-b> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-b>']])
  vim.cmd([[smap <silent><expr> <C-b> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-b>']])
  vim.keymap.set("i", "<C-n>", "<Plug>luasnip-next-choice", {})
  vim.keymap.set("s", "<C-n>", "<Plug>luasnip-next-choice", {})
  vim.keymap.set("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
  vim.keymap.set("s", "<C-p>", "<Plug>luasnip-prev-choice", {})
end

-- cmp
M.cmp = function()
  local ok, cmp = pcall(require, 'cmp')
  if not ok then
    return
  end

  -- cmp icons
  local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
  }

  -- global settings
  cmp.setup({
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.disable,
    },
    mapping = {
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
      ['<Space>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), {"i"}),
      ['<CR>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), {"c"}),
    },
    sources = {
      { name = "buffer" },
    },
    completion = {
      keyword_length = 3,
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
        -- Source
        vim_item.menu = ({
          buffer = "[Buffer]",
          path = "[Path]",
          cmdline = "[Cmd]",
          spell= "[Spell]"
        })[entry.source.name]
        return vim_item
      end
    },
  })

  -- filetype specific example
  --cmp.setup.filetype({ 'lua', 'help' }, {
  --  completion = { autocomplete = false },
  --  sources = {
  --    {name = "buffer"},
  --    {name = 'nvim_lua'}
  --  },
  --})

  -- cmdline
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' },
      { name = 'cmdline' },
      })
  })

  -- markdown
  cmp.setup.filetype({'markdown', 'fish'}, {
    sources = {
      {name = 'spell'},
      {name = 'buffer'},
    },
  })
end

-- treesitter
M.treesitter = function()
  local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
  if not ok then
    return
  end

  treesitter.setup({
    ensure_installed = { "c", "lua", "cpp"},
    highlight = {
      enable = false,
    },
    indent = { enable = true, },
    rainbow = {
      enable = false,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
    },
  })
  vim.keymap.set("n", "<leader>r", "<cmd>TSBufToggle highlight | TSBufToggle rainbow<cr>", {noremap = true, silent = true})
end

-- indent_blankline
M.indent_blankline = function()
  local ok, indent_blankline = pcall(require, 'indent_blankline')
  if not ok then
    return
  end

  indent_blankline.setup({
		filetype_exclude = {
      "help",
      "terminal",
      "alpha",
      "packer",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "mason",
      "",
    },
    show_current_context = true,
    use_treesitter = true,
    show_trailing_blankline_indent = false,
  })
  vim.cmd [[highlight IndentBlanklineContextChar guifg=#b16286 gui=nocombine]]
  vim.cmd [[highlight IndentBlanklineContextSpaceChar guifg=#b16286 gui=nocombine]]
  vim.keymap.set("n", "<leader>i",
    function()
      vim.g.indent_blankline_enabled = not vim.g.indent_blankline_enabled
    end,
    {noremap = true, silent = true})
end

-- nvim-autopairs
M.autopairs = function()
  local ok, autopairs = pcall(require, 'nvim-autopairs')
  if not ok then
    return
  end

  autopairs.setup({
    disable_filetype = { "TelescopePrompt", "vim" },
    fast_wrap = {},
  })
end

-- colorizer
M.colorizer = function()
  local ok, colorizer = pcall(require, 'colorizer')
  if not ok then
    return
  end

  colorizer.setup({
    '*'; --filetypes
    DEFAULT_OPTIONS = {
      RGB      = true;         -- #RGB hex codes
      RRGGBB   = true;         -- #RRGGBB hex codes
      names    = true;         -- "Name" codes like Blue
      RRGGBBAA = false;        -- #RRGGBBAA hex codes
      rgb_fn   = false;        -- CSS rgb() and rgba() functions
      hsl_fn   = false;        -- CSS hsl() and hsla() functions
      css      = false;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn   = false;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
      mode     = 'background'; -- Set the display mode.
    },
  })
end

return M
