return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- colour scheme
  use {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_ui_contrast = 'high'
      vim.cmd "colorscheme gruvbox-material"
    end,
  }

  -- statusline
   use {
     "nvim-lualine/lualine.nvim",
     event = "BufReadPre",
     config = function()
       require("lualine").setup {
         options = {
           theme = 'gruvbox-material',
           section_separators = '',
           component_separators = '',
         }
       }
     end,
   }

end)
