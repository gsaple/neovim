local opts = {noremap = true, silent = true}
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

-- find fildes
keymap("n", "<S-f>", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<S-b>", "<cmd>Telescope buffers<cr>", opts)

-- find projects
keymap("n", "<S-p>", "<cmd>Telescope projects<cr>", opts)

-- navigation, split, close, resize for windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<S-t>", "<C-w>s<C-w>j", opts)
keymap("n", "<S-s>", "<C-w>v<C-w>j", opts)
keymap("n", "<bs>", "<C-w>c", opts)
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
keymap("n", "<C-Right>", "<cmd>vertical-resize +2<cr>", opts)
keymap("n", "<C-Left>", "<cmd>vertical-resize -2<cr>", opts)

-- redraw the screen with current line in the middle
keymap("i", "<C-\\>", "<C-o>zz", opts)

-- moving in insert_mode
keymap("i", "<C-k>", "<C-o>gk", opts)
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-l>", "<Right>", opts)
keymap("i", "<C-j>", "<C-o>gj", opts)

-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down in visual block mode
keymap("x", "<S-j>", ":move '>+1<cr>gv-gv", opts)
keymap("x", "<S-k>", ":move '<-2<cr>gv-gv", opts)

-- paste over currently selected text without yanking it
keymap("v", "p", '"_dP', opts)

-- uppercase word in insert mode, put the cursor within or at the end
keymap("i", "<C-c>", "<Esc>gUiw`]a", opts)

-- center search results
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- paste in insert mode, require unnamedplus for clipboard
keymap("i", "<C-r>", "<C-r>+", opts)

-- navigate through buffers
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

-- navigate through projects (tabs)
keymap("n", "<leader>1", "1gt", opts)
keymap("n", "<leader>2", "2gt", opts)
keymap("n", "<leader>3", "3gt", opts)
keymap("n", "<leader>4", "4gt", opts)
keymap("n", "<leader>5", "5gt", opts)
keymap("n", "<leader>6", "6gt", opts)
keymap("n", "<leader>7", "7gt", opts)
keymap("n", "<leader>8", "8gt", opts)
keymap("n", "<leader>9", "9gt", opts)
