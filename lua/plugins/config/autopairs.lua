local ok, autopairs = pcall(require, 'nvim-autopairs')
if not ok then
  return
end

-- highlight {{{
-- }}}

-- keymapping {{{
-- }}}

-- setup {{{
autopairs.setup({
  disable_filetype = { "TelescopePrompt", "vim" },
  fast_wrap = {},
})
-- }}}

