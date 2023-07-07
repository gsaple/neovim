local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then
  return
end

-- highlight {{{
-- }}}

-- keymapping {{{
-- }}}

-- setup {{{
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
-- }}}
-- }}}
