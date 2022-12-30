M = {}
M.highlight = function(C, D)
  return {
    IndentBlanklineChar = { link = 'CursorLineNr' },
    IndentBlanklineContextChar = { bg = C.grey, fg = C.none },
  }
end
return M
