local opts = {noremap = true, silent = true}
local keymap = vim.keymap.set

-- space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- last non-blank char
keymap("n", "<leader>l", "g_", opts)
-- first non-blank char
keymap("n", "<leader>h", "^", opts)

-- toggle number and relative number
keymap("n", "<leader>k", "<cmd>set nu!<Bar> set rnu!<cr>", opts)

-- toggle cursor line
keymap("n", "<S-k>", "<cmd>set cursorline!<cr>", opts)

-- toggle non-printable chars
keymap("n", "<S-l>", "<cmd>set list!<cr>", opts)

-- stop highlighting
keymap("n", "<Esc>", "<cmd>nohlsearch<Bar>echo<cr>", opts)

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
keymap("v", "p", '"_dP', default_opts)

-- uppercase word in insert mode, put the cursor within or at the end
keymap("i", "~", "<Esc>gUiw`]a", opts)

-- search for non-ASCII chars
keymap("n", "<leader>a", [[:/[^\d0-\d127]<cr>]], opts)

-- center search results
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- paste in insert mode, require unnamedplus for clipboard
keymap("i", "<C-r>", "<C-r>+", opts)
keymap("n", "<leader>p", "<cmd>set paste!<cr>", opts)

-- Telescope
keymap('n', '<leader>f', "<cmd>Telescope find_files<cr>", opts)
keymap('n', '<leader>g', "<cmd>Telescope live_grep<cr>", opt)
keymap('n', '<leader>b', "<cmd>Telescope buffers<cr>", opts)
keymap('n', '<S-h>', "<cmd>Telescope help_tags<cr>", opts)

-- Treesitter
vim.keymap.set("n", "<leader>r", "<cmd>TSBufToggle highlight | TSBufToggle rainbow<cr>", opts)
-- Colorizer
vim.keymap.set("n", "<leader>c", "<cmd>ColorizerToggle<cr>", opts)

