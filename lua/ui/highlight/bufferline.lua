M = {}
M.highlight = function(C, D)
  return {
    BufferLineFill = { link = 'NonText' },
    BufferLineBackground = { bg = C.black, fg = C.grey },
    BufferLineBufferSelected = { bg = C.red, fg = C.black, bold = true },
    BufferLineBufferVisible = { link = 'BufferLineBackground' },
    BufferLineIndicatorSelected = { bg = C.red, fg = C.none },
    BufferLineIndicatorVisible = { bg = C.black, fg = C.none },
    BufferLineDuplicate = { bg = C.black, fg = C.grey, bold = true, italic = true },
    BufferLineDuplicateSelected = { bg = C.red, fg = C.black, bold = true, italic = true },
    BufferLineDuplicateVisible = { link = 'BufferLineDuplicate' },
    BufferLineSeparator = { link = 'Hide' },
    BufferLineTab = { link = 'BufferLineBackground' },
    BufferLineTabSelected = { link = 'BufferLineBufferSelected' },
    BufferLineTabSeparator = { link = 'Hide' },
    BufferLineTabSeparatorSelected = { link = 'Hide' },
    BufferLineTabClose = { bg = D.light_black, fg = C.white },
    BufferLineModified = { link = 'BufferLineBackground' },
    BufferLineModifiedSelected = { bg = C.red, fg = C.black },
    BufferLineModifiedVisible = { link = 'BufferLineModified' },
  }
end
return M
