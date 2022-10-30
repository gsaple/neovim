return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- colour scheme
  use {
    "sainnhe/gruvbox-material",
    config = function()
       require('plugins.config').gruv()
    end,
  }

  -- statusline
   use {
     "nvim-lualine/lualine.nvim",
     event = "BufReadPre",
     config = function()
       require('plugins.config').lualine()
     end,
   }

   -- dev icons
   use {
     "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require('plugins.config').webicon()
      end,
   }
   
end)
