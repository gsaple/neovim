M = {}
M.highlight = function(C, D)
  return {
    NvimTreeNormal = { bg = C.black, fg = C.none },
    NvimTreeCursorLine = { bg = D.light_black, fg = C.none },
    --NvimTreeWinSeparator = { bg = D.black1, fg = C.none },
  }
end
return M
