none = 'NONE'
cursor  = '#528bff' -- should be the same as the terminal cursor

-- available themes: gruvbox_material, onedark
themes = {
  gruvbox_material = {'builtin'},
  onedark = {'statusline'},
}

for colour, categories in pairs(themes) do
  C = require('ui.palette.base.' .. colour) --base colour
  D = require('ui.palette.derive').derived_colour(C) -- derived colour
  for _, category in ipairs(categories) do
    for group, spec in pairs(require('ui.highlight.' .. category)) do
      vim.api.nvim_set_hl(0, group, spec)
    end
  end
end
