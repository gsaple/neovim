M = {}
M.highlight = function(C, D)
  return {
    Comment = { bg = C.none, fg = C.grey },
    Constant = { bg = C.none, fg = C.magenta },
    String = { bg = C.none, fg = C.green },
    Character = { link = 'String' },
    Identifier = { bg = C.none, fg = C.blue },
    Function = { bg = C.none, fg = C.cyan },
    Statement = { bg = C.none, fg = C.red },
    PreProc = { bg = C.none, fg = D.dark_blue },
    Type = { bg = C.none, fg = C.yellow },
    Error = { bg = C.none, fg = D.dark_red },
    Todo = { bg = C.none, fg = C.yellow, bold = true },
    Special = { bg = C.none, fg = C.orange },
    Underlined = { bg = C.none, fg = D.dark_blue, underline = true },
    ExtraWhitespace = { link = 'Special' },
  }
end
return M
