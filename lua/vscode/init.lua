local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- stop highlighting
keymap("n", "<Esc>", "<cmd>nohlsearch<Bar>echo<cr>", opts)

-- last non-blank char
keymap("n", "<leader>l", "g_", opts)

-- first non-blank char
keymap("n", "<leader>h", "^", opts)

-- access the system clipboard
vim.opt.clipboard = "unnamedplus"

-- restart vs code
keymap("n", "<leader>sv", ":call VSCodeNotify('workbench.action.reloadWindow')<cr>", opts)

keymap("n", "<S-f>", ":call VSCodeNotify('workbench.action.quickOpen')<cr>", opts)
keymap("n", "<S-b>", ":call VSCodeNotify('workbench.action.showAllEditors')<cr>", opts)
keymap("n", "<S-s>", ":call VSCodeNotify('workbench.action.splitEditorLeft')<cr>", opts)
keymap("n", "<S-t>", ":call VSCodeNotify('workbench.action.splitEditorUp')<cr>", opts)
keymap("n", "<S-h>", ":call VSCodeNotify('workbench.action.previousEditor')<cr>", opts)
keymap("n", "<S-l>", ":call VSCodeNotify('workbench.action.nextEditor')<cr>", opts)
