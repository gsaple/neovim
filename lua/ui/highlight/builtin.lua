M = {}
M.highlight = function(C, D)
  return {
    Normal = { bg = C.black, fg = C.white },
    Hide = { bg = C.black, fg = C.black },
    ColorColumn = { bg = D.light_black, fg = C.none },
    CurSearch = { bg = D.cursor, fg = C.black },
    CursorColumn = { bg = D.light_black, fg = C.none },
    CursorLine = { bg = D.light_black, fg = C.none },
    Directory = { bg = C.none, fg = C.cyan },
    NonText = { bg = C.black, fg = C.grey },
    ErrorMsg = { bg = D.dark_red, fg = C.none },
    WinSeparator = { bg = D.black1, fg = C.none },
    Folded = { bg = D.light_black, fg = C.grey },
    FoldColumn = { bg = C.black, fg = C.white },
    SignColumn = { bg = C.none, fg = C.none },
    IncSearch = { bg = D.cursor, fg = C.black },
    Search = { bg = C.red, fg = C.black },
    LineNr = { bg = C.none, fg = D.grey1 },
    CursorlineNr = { bg = C.none, fg = C.grey },
    MatchParen = { bg = C.white, fg = C.black },
    Question = { bg = C.none, fg = C.green },
    Pmenu = { bg = C.black, fg = C.white },
    PmenuSel = { bg = D.light_black, fg = C.white },
    SpecialKey = { bg = C.none, fg = C.cyan },
    SpellBad = { underline = true },
    SpellCap = { bg = D.dark_red, fg = C.white },
    Title = { bg = C.none, fg = C.magenta, bold = true },
    Visual = { bg = C.red, fg = C.black },
  }
end
return M
