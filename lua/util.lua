local M = {}

-- colour: hex colour string e.g. '#ea6962'
-- increment: integer to change RGB components, negative for darkening
-- no safe guard here, increment should be sensible
-- e.g. light_black = lighten(colour.black, 5)
M.lighten = function(colour, increment)
  return string.gsub(colour, '#', '0x') + increment * 65793 -- 1 + 16^2 + 16^4
end

M.set_highlight = function(highlight)
  for group, spec in pairs(highlight) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

return M
