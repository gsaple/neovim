-- colour: hex colour string e.g. '#ea6962'
-- increment: integer to change RGB components, negative for darkening
-- no safe guard here, increment should be sensible
local lighten = function(colour, increment)
  return string.gsub(colour, '#', '0x') + increment * 65793 -- 1 + 16^2 + 16^4
end

-- here pass int instead of string for highlighting
return {
  light_black = lighten(C.black, 10),
  grey0 = lighten(C.white, -80),
  grey1 = lighten(C.white, -55),
  dark_red = lighten(C.red, -40),
}
