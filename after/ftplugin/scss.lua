vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.keymap.set("i", "<C-j>", "<Esc>o", { noremap = true, silent = true, buffer = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = vim.api.nvim_create_augroup("scss", {}),
  pattern = { "<buffer>" },
  command = "silent exec '!scss --sourcemap=none -C %:p %:r.css'",
})
