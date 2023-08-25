local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  return
end

-- highlight {{{
local colour = my_nvim.palette[my_nvim.themes.nvim_tree]
local lighten = my_nvim.util.lighten
local light_black = lighten(colour.black, 5)
local dark_red = lighten(colour.red, -40)
local hl = {
  NvimTreeNormal = { bg = colour.black, fg = colour.none },
  NvimTreeCursorLine = { bg = light_black, fg = colour.none },
  NvimTreeEndOfBuffer = { bg = colour.black, fg = colour.black },
  NvimTreeRootFolder = { bg = colour.none, fg = colour.magenta, bold = true },
  NvimTreeSymlink = { bg = colour.none, fg = colour.grey },
  NvimTreeGitDirty = { bg = colour.none, fg = dark_red },
  NvimTreeFolderName = { bg = colour.none, fg = colour.blue },
  NvimTreeEmptyFolderName = { link = "NvimTreeFolderName" },
  NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },
  NvimTreeStatusLine = { bg = colour.black, fg = colour.black },
  NvimTreeStatusLineNC = { link = "NvimTreeStatusLine" },
  -- search NvimTreeTitle from bufferline doc, this is for tree title offset
  -- NvimTreeStatusLineNC includes (wider than) NvimTreeWinSeparator,
  -- but NvimTreeTitle excludes (narrower than) NvimTreeWinSeparator,
  -- run :hi link NvimTreeWinSeparator Hide if bufferline is used
  NvimTreeTitle = { bg = colour.black, fg = colour.green, bold = true },
  NvimTreeWinSeparator = { link = "NvimTreeNormal" },
  --NvimTreeWinSeparator = { link = 'Hide' },
}
my_nvim.util.set_highlight(hl)
-- }}}

-- on_attach key mapping{{{
local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- BEGIN_DEFAULT_ON_ATTACH
  vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("D"))
  --vim.keymap.set('n', '<C-e>',          api.node.open.replace_tree_buffer,  opts('Open: In Place'))
  --vim.keymap.set('n', '<C-k>',          api.node.show_info_popup,           opts('Info'))
  vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
  --vim.keymap.set('n', '<C-t>',          api.node.open.tab,                  opts('Open: New Tab'))
  vim.keymap.set("n", "<C-s>", api.node.open.vertical, opts("Open: Vertical Split"))
  vim.keymap.set("n", "<C-t>", api.node.open.horizontal, opts("Open: Horizontal Split"))
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
  vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
  --vim.keymap.set('n', '<Tab>',          api.node.open.preview,              opts('Open Preview'))
  --vim.keymap.set('n', '>',              api.node.navigate.sibling.next,     opts('Next Sibling'))
  --vim.keymap.set('n', '<',              api.node.navigate.sibling.prev,     opts('Previous Sibling'))
  --vim.keymap.set('n', '.',              api.node.run.cmd,                   opts('Run Command'))
  vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
  vim.keymap.set("n", "<C-f>", api.fs.create, opts('Create, ending with "/" for dir'))
  --vim.keymap.set('n', 'bd',             api.marks.bulk.delete,              opts('Delete Bookmarked'))
  --vim.keymap.set('n', 'bmv',            api.marks.bulk.move,                opts('Move Bookmarked'))
  --vim.keymap.set('n', 'B',              api.tree.toggle_no_buffer_filter,   opts('Toggle No Buffer'))
  vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
  --vim.keymap.set('n', 'C',              api.tree.toggle_git_clean_filter,   opts('Toggle Git Clean'))
  --vim.keymap.set('n', '[c',             api.node.navigate.git.prev,         opts('Prev Git'))
  --vim.keymap.set('n', ']c',             api.node.navigate.git.next,         opts('Next Git'))
  vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
  vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
  --vim.keymap.set('n', 'E',              api.tree.expand_all,                opts('Expand All'))
  vim.keymap.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
  --vim.keymap.set('n', ']e',             api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
  --vim.keymap.set('n', '[e',             api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
  --vim.keymap.set('n', 'F',              api.live_filter.clear,              opts('Clean Filter'))
  --vim.keymap.set('n', 'f',              api.live_filter.start,              opts('Filter'))
  vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
  vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
  vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
  vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
  --vim.keymap.set('n', 'J',              api.node.navigate.sibling.last,     opts('Last Sibling'))
  --vim.keymap.set('n', 'K',              api.node.navigate.sibling.first,    opts('First Sibling'))
  --vim.keymap.set('n', 'm',              api.marks.toggle,                   opts('Toggle Bookmark'))
  --vim.keymap.set('n', 'o',              api.node.open.edit,                 opts('Open'))
  --vim.keymap.set('n', 'O',              api.node.open.no_window_picker,     opts('Open: No Window Picker'))
  vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
  --vim.keymap.set('n', 'P',              api.node.navigate.parent,           opts('Parent Directory'))
  vim.keymap.set("n", "q", api.tree.close, opts("Close"))
  vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
  vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
  --vim.keymap.set('n', 's',              api.node.run.system,                opts('Run System'))
  --vim.keymap.set('n', 'S',              api.tree.search_node,               opts('Search'))
  --vim.keymap.set('n', 'U',              api.tree.toggle_custom_filter,      opts('Toggle Hidden'))
  --vim.keymap.set('n', 'W',              api.tree.collapse_all,              opts('Collapse'))
  vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
  vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
  vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
  --vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,                 opts('Open'))
  --vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node,       opts('CD'))
  -- END_DEFAULT_ON_ATTACH
end
---}}}

-- setup {{{
nvim_tree.setup({
  on_attach = on_attach,
  respect_buf_cwd = true,
  sync_root_with_cwd = true,
  hijack_cursor = true,
  view = {
    --adaptive_size = true,
    float = {
      enable = false,
      open_win_config = function()
        return {
          border = "rounded",
          relative = "editor",
          row = 0,
          col = 0,
          width = 30,
          height = vim.opt.lines:get(),
          style = "minimal",
        }
      end,
    },
  },
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = {},
  },
  renderer = {
    icons = { git_placement = "after" },
    root_folder_label = ":~:s?$?//?",
    indent_markers = { enable = true },
  },
  filters = {
    custom = { "^\\.git" },
    exclude = { ".gitignore" },
  },
  actions = {
    file_popup = {
      open_win_config = {
        row = 0,
        col = 20,
        relative = "cursor",
        border = "rounded",
        style = "minimal",
      },
    },
    change_dir = {
      global = true,
    },
  },
  live_filter = {
    always_show_folders = false,
  },
})
-- }}}
