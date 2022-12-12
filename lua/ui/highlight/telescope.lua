-- Inspired by https://github.com/NvChad/base46/blob/master/lua/base46/integrations/telescope.lua
M = {}
M.highlight = function(C, D)
  return {
    TelescopeBorder = { bg = C.black, fg = C.black },
    TelescopeNormal = { bg = C.black, fg = C.white },
    TelescopePromptBorder = { bg = D.light_black, fg = D.light_black },
    TelescopePromptNormal = { bg = D.light_black, fg = C.white },
    TelescopePromptPrefix = { bg = none, fg = C.green },
    TelescopePromptTitle = { bg = C.red, fg = C.black },
    TelescopeResultsTitle = { link = 'TelescopeBorder' },
    TelescopePreviewTitle = { bg = C.green, fg = C.black },
    TelescopePromptCounter = { link = 'TelescopePromptNormal' },
    TelescopeSelection = { link = 'TelescopePromptNormal' },
  }
end
return M
