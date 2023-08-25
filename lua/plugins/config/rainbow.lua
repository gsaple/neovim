local colour = my_nvim.palette[my_nvim.themes.rainbow]
local hl = {
  TSRainbowOrange = { bg = colour.none, fg = colour.orange, bold = true },
  TSRainbowBlue = { bg = colour.none, fg = colour.blue, bold = true },
  TSRainbowViolet = { bg = colour.none, fg = colour.magenta, bold = true },
  TSRainbowYellow = { bg = colour.none, fg = colour.yellow, bold = true },
  TSRainbowCyan = { bg = colour.none, fg = colour.cyan, bold = true },
  TSRainbowRed = { bg = colour.none, fg = colour.red, bold = true },
  TSRainbowGreen = { bg = colour.none, fg = colour.green, bold = true },
}
my_nvim.util.set_highlight(hl)
