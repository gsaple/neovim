local ok, mason = pcall(require, "mason")
if not ok then
  return
end

local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
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
    border = "double",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

mason_lspconfig.setup({
  ensure_installed = my_nvim.lsp_servers,
})
-- }}}
