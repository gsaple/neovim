-- available themes: gruvbox_material, onedark
-- linked components should use same colour sheme
local themes = {
  gruvbox_material = { 'builtin', 'syntax', 'treesitter', 'indent_blankline', 'cmp'},
  onedark = { 'statusline', 'rainbow', 'telescope', 'which_key', 'nvim_tree', 'float_window', 'bufferline'},
}

for colour, categories in pairs(themes) do
  local C = require('ui.palette.base.' .. colour) --base colour
  local D = require('ui.palette.derive').derived_colour(C) -- derived colour
  for _, category in ipairs(categories) do
    for group, spec in pairs(require('ui.highlight.' .. category).highlight(C, D)) do
      vim.api.nvim_set_hl(0, group, spec)
    end
  end
end
