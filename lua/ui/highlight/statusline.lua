M = {}
M.highlight = function(C, D)
  return {
    StatusLineNormalMode = { bg = C.green, fg = C.black, bold = true },
    StatusLineVisualMode = { bg = C.red, fg = C.black, bold = true },
    StatusLineSelectMode = { bg = C.yellow , fg = C.black, bold = true, },
    StatusLineInsertMode = { bg = C.blue, fg = C.black, bold = true },
    StatusLineReplaceMode = { bg = C.orange, fg = C.black, bold = true },
    StatusLineCommandMode = { bg = C.magenta, fg = C.black, bold = true },
    StatusLineTerminalMode = { bg = C.cyan, fg = C.black, bold = true },
    StatusLineModeNotFound = { bg = C.grey, fg = C.black, bold = true },
    StatusLineFileInfo = { bg = C.black, fg = C.white },
    StatusLineFileType = { bg = C.black, fg = C.white },
    StatusLine = { bg = C.black, fg = C.none },
    StatusLineNC = { bg = C.black, fg = C.white }, -- fg only makes it unequal to above, no practical purposes
  }
end
return M
