local va = vim.api
-- statusline
va.nvim_create_augroup("statusline", { clear = true })
va.nvim_create_autocmd({"BufEnter", "WinEnter"}, {
  group = "statusline",
  callback = function()
    if vim.bo.filetype == 'NvimTree' then
      vim.cmd [[setlocal statusline=%!v:lua.require('ui.statusline').no_statusline()"]]
    else
      vim.cmd [[setlocal statusline=%!v:lua.require('ui.statusline').active_statusline()"]]
    end
  end
})
va.nvim_create_autocmd({"BufLeave", "WinLeave"}, {
  group = "statusline",
  callback = function()
    if vim.bo.filetype == 'NvimTree' then
      vim.cmd [[setlocal statusline=%!v:lua.require('ui.statusline').no_statusline()"]]
    else
      vim.cmd [[setlocal statusline=%!v:lua.require('ui.statusline').inactive_statusline()"]]
    end
  end
})
