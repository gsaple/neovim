local M = {}

-- gruvbox_material scheme
M.gruv = function() 
  vim.g.gruvbox_material_ui_contrast = 'high'
  local ok, _ = pcall(vim.cmd, 'colorscheme gruvbox-material')
  if not ok then
    return
  end
end

-- lualine
M.lualine = function()
  local ok, lualine = pcall(require, 'lualine')
  if not ok then
    return
  end
  lualine.setup {
    options = {
      theme = 'gruvbox-material',
      section_separators = '',
      component_separators = '',
    },
    sections = {
      lualine_b = {'branch'},
    }
  }
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
    region_check_events = 'CursorMoved',

  }
  vim.cmd([[imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' ]])
  vim.cmd([[smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>']])
  vim.cmd([[imap <silent><expr> <C-b> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-b>']])
  vim.cmd([[smap <silent><expr> <C-b> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-b>']])
end

return M
