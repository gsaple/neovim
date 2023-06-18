M = {}
M.highlight = function(C, D)
  return {
    NormalFloat = { bg = C.black, fg = C.none },
    FloatBorder = { bg = C.none, fg = C.grey },
  }
end
return M
