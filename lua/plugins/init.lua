local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  print '==============================================='
  print '       Plugins are going to be installed;'
  print '       Blank screen may be encountered;'
  print '       Wait until Lazy completes;'
  print '       Then restart nvim'
  print '==============================================='
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
local opts = { 
  defaults = { lazy = true },
  install = { colorscheme = nil },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = false,
    notify = false, -- get a notification when changes are found
  },
}
require("lazy").setup('plugins.plugins', opts)
