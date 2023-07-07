local M = {}

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
