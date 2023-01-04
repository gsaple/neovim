local opt = vim.opt
opt.clipboard = "unnamedplus"  -- access the system clipboard
opt.completeopt = "menu,menuone,noselect"
--opt.cursorline = true
opt.expandtab = true -- convert tabs to spaces when a <Tab> is pressed
opt.fillchars = {vert = " ", vertleft = " ", vertright = " ",
                 horiz = " ", horizup = " ", horizdown = " ",verthoriz = " "}
opt.foldmethod = "marker"
opt.history = 2000
opt.ignorecase = true
opt.laststatus = 3
opt.linebreak = true
opt.listchars = "tab: ,space:␣,eol:﬋,trail:"
opt.mouse = "a" -- allow mouse to be used in nvic
opt.pumheight = 10
opt.ruler = false
opt.scrolloff = 2
opt.shiftwidth = 4 -- number of spaces when <<, >> or = is pressed
opt.shortmess:append "sI"
opt.showbreak = '↳ '
opt.showcmd = false
opt.showmode = false
opt.sidescrolloff = 5
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4 -- number of spaces that a <Tab> in a file (maybe written by others) counts for
opt.timeoutlen = 300
opt.termguicolors = true
opt.updatetime = 300
opt.virtualedit = 'block'
opt.wrap = false
opt.whichwrap = "h,l,<,>,[,]"

--global variables
cmp_toggle = true
cmp_general = { 'lua' }
ts_parsers = { "html", "css", "javascript",
                "c", "cpp", "java", "rust", "go",
                "lua", "python", "bash", "fish",
                "comment",
             }

-- disable some builtin vim plugins {{{
local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}
for _, plugin in pairs(default_plugins) do
  vim.g["loaded_" .. plugin] = 1
end
local default_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}
for _, provider in ipairs(default_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
---}}}
