local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then
  return
end

-- highlight {{{
local colour = my_nvim.palette[my_nvim.themes.indent_blankline]
local hl = {
  IndentBlanklineChar = { bg = colour.none, fg = colour.grey },
  IndentBlanklineContextChar = { bg = colour.grey, fg = colour.none },
}
my_nvim.util.set_highlight(hl)
-- }}}

-- keymapping {{{
-- }}}

-- setup {{{
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
vim.cmd([[IndentBlanklineDisable]])
-- }}}
