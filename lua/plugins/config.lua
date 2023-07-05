local M = {}

-- luasnip {{{
M.luasnip = function()
  local ok, luasnip = pcall(require, 'luasnip')
  if not ok then
    return
  end
  require('luasnip.loaders.from_lua').load({paths = '~/.config/nvim/lua/snippets/'})
  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip").setup({
    enable_autosnippets = true,
    update_events = 'TextChanged,TextChangedI',
    region_check_events = 'InsertEnter',
  })
  vim.keymap.set('i', '<Tab>', function()
      return luasnip.expand_or_jumpable() and '<Plug>luasnip-expand-or-jump' or '<Tab>'
  end, {expr = true})
  vim.keymap.set('s', '<Tab>', '<Plug>luasnip-jump-next', {})
  vim.keymap.set({'i', 's'}, '<C-b>', '<Plug>luasnip-jump-prev', {})
  vim.keymap.set({'i', 's'}, '<C-n>', function()
      return luasnip.choice_active() and '<Plug>luasnip-next-choice' or nil
  end, {expr = true})
  vim.keymap.set({'i', 's'}, '<C-p>', function()
      return luasnip.choice_active() and '<Plug>luasnip-prev-choice' or nil
  end, {expr = true})

end
-- }}}

-- treesitter {{{
M.treesitter = function()
  local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
  if not ok then
    return
  end

  treesitter.setup({
    ensure_installed = global_params.tree_sitter.parsers,
    highlight = {
      enable = false,
      disable = { "html" },
    },
    indent = { enable = true, },
    rainbow = {
      enable = false,
      --list of languages you want to disable the plugin for
      disable = { "jsx", "html", },
      query = 'rainbow-parens',
      -- Highlight the entire buffer all at once
      strategy = require('ts-rainbow').strategy.global,
    },
  })
end
-- }}}

-- indent_blankline {{{
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
    context_char = " ",
    show_current_context = true,
    use_treesitter = true,
    show_trailing_blankline_indent = false,
  })
  vim.cmd [[IndentBlanklineDisable]]
end
-- }}}

-- nvim-autopairs {{{
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
-- }}}

-- colorizer {{{
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
-- }}}

-- which-key {{{
M.which_key = function()
  local ok, which_key = pcall(require, 'which-key')
  if not ok then
    return
  end

  which_key.setup({
    plugins = {
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false, -- default bindings on <c-w>
        nav = false, -- misc bindings to work with windows
        z = false, -- bindings for prefixed with z
        g = false, -- bindings for prefixed with g
      }
    },
    icons = {
      group = " ",
    },
    popup_mappings = {
      scroll_down = '<c-j>',
      scroll_up = '<c-k>',
    },
    window = {
      border = "none", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
    ignore_missing = true,
    layout = {
      height = { min = 4, max = 10 }, -- min and max height of the columns
      width = { min = 20, max = 90 }, -- min and max width of the columns
      spacing = 10, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    disable = {
      buftypes = {"prompt"},
      filetypes = { "TelescopePrompt", "NvimTree" },
    },
    show_help = false,
    show_keys = false,
  })

  local map = require('core.keyregister')
  --local opts = {
  --  mode = "n", -- normal mode
  --  prefix = "<>",
  --  buffer = nil, -- Specify a buffer number for buffer local mappings
  --  silent = true, -- use `silent` when creating keymaps
  --  noremap = true, -- use `noremap` when creating keymaps
  --  nowait = false, -- use `nowait` when creating keymaps
  --}
  which_key.register(map, { prefix = "<leader>" })
  which_key.register({
    ["`"] = "which_key_ignore",
    ["@"] = "which_key_ignore",
    ['"'] = "which_key_ignore",
    ["'"] = "which_key_ignore",
  })
end
-- }}}

-- toggleterm {{{
M.toggleterm = function()
  local ok, toggleterm = pcall(require, 'toggleterm')
  if not ok then
    return
  end
  toggleterm.setup({
    open_mapping = [[<C-\>]],
    shade_terminals = false,
    direction = 'float',
    float_opts = {
      border = 'double',
    },
    highlights = {
      -- floatwindow only
      FloatBorder = {
        link = 'FloatBorder',
      },
    },
  })
end
-- }}}

-- vimtex {{{
M.vimtex = function()
  vim.g.vimtex_mappings_enabled = 0
  vim.g.vimtex_complete_enabled = 0
  vim.g.vimtex_view_method = 'zathura'
  vim.g.vimtex_quickfix_ignore_filters = {
    'Underfull \\\\hbox',
    'Overfull \\\\hbox',
  }
end
-- }}}

-- mason {{{
M.mason = function()
  local ok, mason = pcall(require, 'mason')
  if not ok then
    return
  end
  mason.setup({
    ui = {
      border = 'double',
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      },
    },
  })
end
-- }}}

return M
