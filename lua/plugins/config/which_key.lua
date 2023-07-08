local ok, which_key = pcall(require, 'which-key')
if not ok then
  return
end

-- highlight {{{
local colour = my_nvim.palette[my_nvim.themes.which_key]
local hl = {
WhichKey = { bg = colour.none, fg = colour.red },
WhichKeyGroup = { bg = colour.none, fg = colour.orange, bold = true },
WhichKeySeparator = { bg = colour.none, fg = colour.grey },
WhichKeyDesc = { bg = colour.none, fg = colour.cyan },
WhichKeyFloat = { bg = colour.black, fg = colour.white },
WhichKeyBorder = { bg = colour.none, fg = colour.grey },
WhichKeyValue = { link  = 'WhichKeySeparator'},
}
my_nvim.util.set_highlight(hl)
-- }}}

-- setup {{{
which_key.setup({
  plugins = {
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
    },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false, -- default bindings on <c-w>
      nav = false, -- misc bindings to work with windows
      z = false, -- bindings for prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  icons = {
    group = " ",
  },
  popup_mappings = {
    scroll_down = '<c-j>',
    scroll_up = '<c-k>',
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
  },
  ignore_missing = true,
  layout = {
    height = { min = 4, max = 10 }, -- min and max height of the columns
    width = { min = 20, max = 90 }, -- min and max width of the columns
    spacing = 10, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  disable = {
    buftypes = {"prompt"},
    filetypes = { "TelescopePrompt", "NvimTree" },
  },
  show_help = false,
  show_keys = false,
})
-- }}}

-- keymapping {{{
local map = {
  a = { [[:/[^\d0-\d127]<cr>]], "search non-ASCII chars" },
  g = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "treesitter playground" },
  k = { "<cmd>set nu!<Bar> set rnu!<cr>", "toggle line numbers" },
  n = { "<cmd>tabnew<cr>", "open new project(s)"},
  c = { "<cmd>cclose<cr>", "close quickfix window"},
  i = { "go to ith tab (project)" }, -- doc only
  t = {
    name = "Toggle",
    p = { "<cmd>set cursorline!<Bar> set cursorcolumn!<cr>", "cursor lc" },
    l = { "<cmd>set list!<cr>", "non printable" },
    c = { "<cmd>lua my_nvim.cmp.toggle = not my_nvim.cmp.toggle<cr>", "cmp" },
    i = { "<cmd>IndentBlanklineToggle<cr>", "indent line" },
    C = { "<cmd>ColorizerToggle<cr>", "colorizer" },
    h = { "<cmd>TSBufToggle highlight <Bar> TSBufToggle rainbow<cr>", "treesitter" },
    f = { "<cmd>NvimTreeOpen<cr>", "file explorer" },
    b = { function() vim.opt.showtabline = (vim.go.showtabline == 0 and 2 or 0) end, "tabline" },
    t = { "<cmd>ToggleTerm<cr>", "open terminal"},
  },
  f = {
    name = "Finder",
    f = { "<cmd> lua require('telescope.builtin').find_files() <cr>", "find files" },
    a = { "<cmd> lua require('telescope.builtin').find_files({hidden=true}) <cr>", "find hidden" },
    g = { "<cmd> lua require('telescope.builtin').live_grep() <cr>", "live grep" },
    b = { "<cmd> lua require('telescope.builtin').buffers({only_cwd=true,ignore_current_buffer=true })<cr>", "find buffers" },
    h = { "<cmd> lua require('telescope.builtin').help_tags() <cr>", "help page" },
    o = { "<cmd> lua require('telescope.builtin').oldfiles() <cr>", "find oldfiles" },
    p = { "<cmd> NvimTreeClose<Bar>lua require('telescope').extensions.projects.projects{}<cr>", "find project" },
  },
  L = {
    name = "Latex",
    c = { "<plug>(vimtex-compile)", "continuous compile" },
    C = { "<plug>(vimtex-stop)", "stop compilation" },
    s = { "<plug>(vimtex-compile-ss)", "single compile" },
    v = { "<plug>(vimtex-view)", "view PDF" },
    x = { "<plug>(vimtex-clean)", "clean auxiliary files" },
  },
  d = {
    name = "Doc Only",
    o = { 
      name = "Other",
      ["<C-\\>"] = { "redraw in the middle (insert)" },
      ["<C-c>"] = { "capitalise word (insert)" },
      ["<C-p>"] = { "toggle terminal" },
      J = { "move text block down (visual)" },
      K = { "move text block up (visual)" },
      T = { "split window at bottom (normal) "},
      S = { "split window on right (normal) "},
    },
    t = {
      name = "Telescope",
      ["<C-j>"] = { "select next" },
      ["<C-k>"] = { "select previous" },
      ["<C-n>"] = { "history next" },
      ["<C-p>"] = { "history prev" },
      ["<M-p>"] = { "toggle preview" },
      ["<C-u>"] = { "scroll preview up" },
      ["<C-d>"] = { "scroll preview down" },
      ["<C-s>"] = { "vertical spilt" },
      ["<C-t>"] = { "horizontal spilt" },
      ["<C-x>"] = { "tab spilt" },
      ["<C-w>"] = { "change working directory" },
      ["<C-/>"] = { "see all available mappings" },
    },
    f = {
      name = "File Explorer",
      ["?"] = { "see all available mappings" },
      ["<C-]>"] = { "change directory" },
      u = { "directory up" },
      ["<C-f>"] = { "create file (or directory trailing '/')" },
      ["<C-r>"] = { "rename" },
      c = { "copy file" },
      y = { "copy file name" },
      Y = { "copy relative path" },
    },
  },
}
--local opts = {
--  mode = "n", -- normal mode
--  prefix = "<>",
--  buffer = nil, -- Specify a buffer number for buffer local mappings
--  silent = true, -- use `silent` when creating keymaps
--  noremap = true, -- use `noremap` when creating keymaps
--  nowait = false, -- use `nowait` when creating keymaps
--}
which_key.register(map, { prefix = "<leader>" })
which_key.register({
  ["`"] = "which_key_ignore",
  ["@"] = "which_key_ignore",
  ['"'] = "which_key_ignore",
  ["'"] = "which_key_ignore",
})
-- }}}
