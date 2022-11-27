none = 'NONE'
cursor  = '#528bff' -- should be the same as the terminal cursor

local colour_loaded = nil
for category, colour in pairs(themes) do
  if colour ~= colour_loaded then
    C = require('ui.palette.base.' .. colour)
    D = require('ui.palette.derive')
    colour_loaded = colour
  end
  for group, spec in pairs(require('ui.highlight.' .. category)) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

-- setup statusline
--vim.opt.statusline = "%!v:lua.require('ui.statusline').config()"
