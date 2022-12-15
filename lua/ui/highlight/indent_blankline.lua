M = {}
M.highlight = function(C, D)
  return {
    IndentBlanklineChar = { link = 'CursorLineNr' },
    IndentBlanklineContextChar = { link = 'CursorLine' },
  }
end
return M
