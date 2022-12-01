local va = vim.api
-- statusline
va.nvim_create_augroup("statusline", { clear = true })
va.nvim_create_autocmd({"BufEnter", "WinEnter"}, {
  group = "statusline",
  command = "setlocal statusline=%!v:lua.require('ui.statusline').active_statusline()"
})
va.nvim_create_autocmd({"BufLeave", "WinLeave"}, {
  group = "statusline",
  command = "setlocal statusline=%!v:lua.require('ui.statusline').inactive_statusline()"
})
