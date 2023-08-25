local builtin = my_nvim.palette[my_nvim.themes.builtin]
local syntax = my_nvim.palette[my_nvim.themes.syntax]
local cursor = my_nvim.palette.cursor
local lighten = my_nvim.util.lighten
local light_black = lighten(builtin.black, 5)
local dark_black = lighten(builtin.black, -5)
local dark_red = lighten(builtin.red, -40)
local dark_grey = lighten(builtin.grey, -30)
local dark_blue = lighten(syntax.blue, -40)
local dark_red_s = lighten(syntax.red, -40)

local hl = {
  -- builtin group {{{
  Normal = { bg = builtin.black, fg = builtin.white },
  Hide = { bg = builtin.black, fg = builtin.black },
  ColorColumn = { bg = light_black, fg = builtin.none },
  CurSearch = { bg = cursor, fg = builtin.black },
  CursorColumn = { link = "ColorColumn" },
  CursorLine = { link = "ColorColumn" },
  Directory = { bg = builtin.none, fg = builtin.cyan },
  NonText = { bg = builtin.black, fg = builtin.grey },
  ErrorMsg = { bg = dark_red, fg = builtin.none },
  WarningMsg = { bg = builtin.none, fg = dark_red },
  WinSeparator = { bg = dark_black, fg = builtin.none },
  Folded = { bg = light_black, fg = builtin.grey },
  FoldColumn = { bg = builtin.black, fg = builtin.white },
  SignColumn = { bg = builtin.none, fg = builtin.none },
  IncSearch = { bg = cursor, fg = builtin.black },
  Search = { bg = builtin.red, fg = builtin.black },
  LineNr = { bg = builtin.none, fg = dark_grey },
  CursorlineNr = { bg = builtin.none, fg = builtin.grey },
  MatchParen = { bg = builtin.white, fg = builtin.black },
  Question = { bg = builtin.none, fg = builtin.green },
  Pmenu = { bg = builtin.black, fg = builtin.white },
  PmenuSel = { bg = light_black, fg = builtin.white },
  SpecialKey = { bg = builtin.none, fg = builtin.cyan },
  SpellBad = { underline = true },
  SpellCap = { bg = dark_red, fg = builtin.white },
  Title = { bg = builtin.none, fg = builtin.magenta, bold = true },
  Visual = { bg = builtin.red, fg = builtin.black },
  NormalFloat = { bg = builtin.none, fg = builtin.white },
  FloatBorder = { bg = builtin.none, fg = builtin.grey },
  -- }}}
  -- syntax group {{{
  Comment = { bg = syntax.none, fg = syntax.grey },
  Constant = { bg = syntax.none, fg = syntax.magenta },
  String = { bg = syntax.none, fg = syntax.green },
  Character = { link = "String" },
  Identifier = { bg = syntax.none, fg = syntax.blue },
  Function = { bg = syntax.none, fg = syntax.cyan },
  Statement = { bg = syntax.none, fg = syntax.red },
  PreProc = { bg = syntax.none, fg = dark_blue },
  Type = { bg = syntax.none, fg = syntax.yellow },
  Error = { bg = syntax.none, fg = dark_red_s },
  Todo = { bg = syntax.none, fg = syntax.yellow, bold = true },
  Special = { bg = syntax.none, fg = syntax.orange },
  Underlined = { bg = syntax.none, fg = dark_blue, underline = true },
  ExtraWhitespace = { link = "Special" },
  -- }}}
}
my_nvim.util.set_highlight(hl)
