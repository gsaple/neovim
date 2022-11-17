-- store config file folds permanently
local id = vim.api.nvim_create_augroup("AutoSaveFolds", {
  clear = true
})

vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = {"config.lua", "plugins.lua"},
  callback = function()
    vim.opt.viewdir = vim.fn.stdpath('config')..'/lua/view'
    vim.cmd([[silent! loadview]])
  end,
  group = id,
})

vim.api.nvim_create_autocmd({"VimLeave"}, {
  pattern = {"config.lua", "plugins.lua"},
  command = "silent! mkview!",
  group = id,
})

-- move help window to the right
vim.cmd([[
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
  augroup END
]])
