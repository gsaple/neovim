return {
  a = { [[:/[^\d0-\d127]<cr>]], "search non-ASCII chars" },
  g = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "treesitter playground" },
  k = { "<cmd>set nu!<Bar> set rnu!<cr>", "toggle line numbers" },
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
  t = {
    name = "Toggle",
    p = { "<cmd>set cursorline!<Bar> set cursorcolumn!<cr>", "cursor lc" },
    l = { "<cmd>set list!<cr>", "non printable" },
    c = { "<cmd>lua cmp_toggle = not cmp_toggle<cr>", "cmp" },
    i = { "<cmd>IndentBlanklineToggle<cr>", "indent line" },
    C = { "<cmd>ColorizerToggle<cr>", "colorizer" },
    t = { "<cmd>TSBufToggle highlight<cr>", "treesitter" },
    r = { "<cmd>TSBufToggle rainbow<cr>", "rainbow brackets" },
    f = { "<cmd>NvimTreeToggle<cr>", "file explorer" },
  },
  f = {
    name = "Finder",
    f = { "<cmd> silent! Telescope find_files <cr>", "find files" },
    a = { "<cmd> silent! Telescope find_files hidden=true <cr>", "find hidden" },
    g = { "<cmd> silent! Telescope live_grep <cr>", "live grep" },
    b = { "<cmd> silent! Telescope buffers <cr>", "find buffers" },
    h = { "<cmd> silent! Telescope help_tags <cr>", "help page" },
    o = { "<cmd> silent! Telescope oldfiles <cr>", "find oldfiles" },
  },
  d = {
    name = "Doc Only",
    o = { 
      name = "Other",
      ["<C-\\>"] = { "redraw in the middle (insert)" },
      ["<C-c>"] = { "capitalise word (insert)" },
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
      ["<C-/>"] = { "see all available mappings" },
    },
  },
}
