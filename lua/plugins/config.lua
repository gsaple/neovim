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

return M
