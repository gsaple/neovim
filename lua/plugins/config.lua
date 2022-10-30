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
    },
    sections = {
      lualine_b = {'branch'},
    }
  }
end

  -- web dev icon
  M.webicon = function()
    local ok, icon = pcall(require, 'nvim-web-devicons')
    if not ok then
      return
    end
    icon.setup {
      default = true,
    }
  end

return M
