-- available themes: gruvbox_material, onedark, everforest, kanagawa
-- linked components may use same colour sheme
local themes = {
  gruvbox_material = { 'builtin', 'syntax', 'treesitter', 'indent_blankline', 'cmp' },
  everforest = { 'nvim_tree', 'rainbow', 'float_window', 'which_key' },
  onedark = { 'statusline', 'telescope' },
  kanagawa = { 'bufferline' }
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
