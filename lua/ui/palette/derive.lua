-- colour: hex colour string e.g. '#ea6962'
-- increment: integer to change RGB components, negative for darkening
-- no safe guard here, increment should be sensible
local lighten = function(colour, increment)
  return string.gsub(colour, '#', '0x') + increment * 65793 -- 1 + 16^2 + 16^4
end

M = {}
-- here pass int instead of string for highlighting
M.derived_colour = function(C)
  return {
    light_black = lighten(C.black, 5),
    black1 = lighten(C.black, 10),
    black2 = lighten(C.black, 30),
    grey1 = lighten(C.grey, -30),
    dark_red = lighten(C.red, -40),
    dark_blue = lighten(C.blue, -40),
    cursor = '#528bff', -- should be the same as the terminal cursor
  }
end
return M
