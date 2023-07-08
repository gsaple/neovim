-- highlight {{{
-- by default Floaterm linked to Normal, FloatermBorder linked to NormalFloat
-- }}}

-- setup {{{
vim.g.floaterm_title = ""
vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.9
vim.g.floaterm_giteditor = false
vim.g.floaterm_autoclose = 2
vim.g.floaterm_borderchars = "═║═║╔╗╝╚"
-- }}}

-- keymapping {{{
local opts = {noremap = true, silent = true}
local keymap = vim.keymap.set
keymap("n", "<C-g>", "<cmd>FloatermNew lazygit<cr>", opts)
keymap("n", "<C-\\>", "<cmd>FloatermToggle<cr>", opts)
-- }}}
