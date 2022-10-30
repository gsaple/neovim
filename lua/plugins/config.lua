local M = {}

-- gruvbox_material scheme
M.gruv = function() 
  vim.g.gruvbox_material_ui_contrast = 'high'
  local ok, _ = pcall(vim.cmd, 'colorscheme gruvbox-material')
  if not ok then
    return
  end
end

-- lualine
M.lualine = function()
  local ok, lualine = pcall(require, 'lualine')
  if not ok then
    return
  end
  lualine.setup {
    options = {
      theme = 'gruvbox-material',
      section_separators = '',
      component_separators = '',
    }
  }
end

return M
