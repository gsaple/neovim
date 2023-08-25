local ok, luasnip = pcall(require, "luasnip")
if not ok then
  return
end

-- highlight {{{
-- }}}

-- keymapping {{{
vim.keymap.set("i", "<Tab>", function()
  return luasnip.expand_or_jumpable() and "<Plug>luasnip-expand-or-jump" or "<Tab>"
end, { expr = true })
vim.keymap.set("s", "<Tab>", "<Plug>luasnip-jump-next", {})
vim.keymap.set({ "i", "s" }, "<C-b>", "<Plug>luasnip-jump-prev", {})
vim.keymap.set({ "i", "s" }, "<C-n>", function()
  return luasnip.choice_active() and "<Plug>luasnip-next-choice" or nil
end, { expr = true })
vim.keymap.set({ "i", "s" }, "<C-p>", function()
  return luasnip.choice_active() and "<Plug>luasnip-prev-choice" or nil
end, { expr = true })
-- }}}

-- setup {{{
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip").setup({
  enable_autosnippets = true,
  update_events = "TextChanged,TextChangedI",
  region_check_events = "InsertEnter",
})
-- }}}
