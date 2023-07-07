_G.my_nvim = {}

my_nvim.palette = require("ui.palette")

-- available themes: gruvbox_material, onedark, everforest, kanagawa
my_nvim.themes = {
  builtin = 'gruvbox_material',
  syntax = 'gruvbox_material',
  treesitter = 'gruvbox_material',
  indent_blankline = 'gruvbox_material',
  cmp = 'gruvbox_material',
  float_window = 'gruvbox_material',
  nvim_tree = 'everforest',
  rainbow = 'everforest',
  which_key = 'everforest',
  statusline =  'onedark',
  telescope = 'onedark',
  tabline = 'kanagawa',
}

my_nvim.cmp = {
  toggle = true,
  spell_trigger = { 'markdown', 'gitcommit', 'tex' },
}

-- file type triggers for cmp completion and lsp config
my_nvim.ft_trigger = { 'lua', 'python', 'html', 'css', }

-- treesitter parsers
my_nvim.parsers = {
  "css", "javascript", "c", "cpp", "java", "lua", "python", "bash", "fish", "comment",
  "markdown", "markdown_inline",
}

my_nvim.util = require("util")

require('core')
require('ui')
require('plugins')
