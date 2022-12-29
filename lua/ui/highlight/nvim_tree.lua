M = {}
M.highlight = function(C, D)
  return {
    NvimTreeNormal = { bg = C.black, fg = C.none },
    NvimTreeCursorLine = { bg = D.light_black, fg = C.none },
    NvimTreeEndOfBuffer = { bg = C.black, fg = C.black },
    NvimTreeRootFolder = { bg = C.none, fg = C.magenta, bold = true },
    NvimTreeSymlink = { bg = C.none, fg = C.grey },
    NvimTreeGitDirty = { bg = C.none, fg = D.dark_red },
    NvimTreeFolderName = { bg = C.none, fg = C.blue },
    NvimTreeEmptyFolderName = { link = 'NvimTreeFolderName'},
    NvimTreeOpenedFolderName = { link = 'NvimTreeFolderName'},
    NvimTreeStatusLine = { link = 'Hide' },
    NvimTreeStatusLineNC = { link = 'NvimTreeStatusLine' },
    NvimTreeTitle = { bg = C.black, fg = C.green, bold = true }, -- for bufferline offset
    NvimTreeWinSeparator = { link = 'Hide' },
  }
end
return M
