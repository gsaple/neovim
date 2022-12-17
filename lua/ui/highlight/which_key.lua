M = {}
M.highlight = function(C, D)
  return {
    WhichKey = { bg = C.none, fg = C.red },
    WhichKeyGroup = { bg = C.none, fg = C.orange, bold = true },
    WhichKeySeparator = { bg = C.none, fg = C.grey },
    WhichKeyDesc = { bg = C.none, fg = C.cyan },
    WhichKeyFloat = { bg = C.black, fg = C.white },
    WhichKeyBorder = { bg = C.none, fg = C.grey },
    WhichKeyValue = { link  = 'WhichKeySeparator'},
  }
end
return M
