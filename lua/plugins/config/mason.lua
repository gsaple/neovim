local ok, mason = pcall(require, 'mason')
if not ok then
  return
end

-- highlight {{{
-- }}}

-- keymapping {{{
-- }}}

-- setup {{{
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
-- }}}
