M = {}
M.highlight = function(C, D)
  return {
    NvimTreeNormal = { bg = C.black, fg = C.none },
    NvimTreeCursorLine = { bg = D.light_black, fg = C.none },
    NvimTreeEndOfBuffer = { bg = C.black, fg = C.black }
    --NvimTreeStatusLine = {},
    --NvimTreeStatusLineNC = {},
    --NvimTreeWinSeparator = {},
  }
end
return M
