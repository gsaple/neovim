-- draw statusline

-- statusline highlight {{{
local colour = my_nvim.palette[my_nvim.themes.statusline]
local hl = {
  StatusLineNormalMode = { bg = colour.green, fg = colour.black, bold = true },
  StatusLineVisualMode = { bg = colour.red, fg = colour.black, bold = true },
  StatusLineSelectMode = { bg = colour.yellow , fg = colour.black, bold = true, },
  StatusLineInsertMode = { bg = colour.blue, fg = colour.black, bold = true },
  StatusLineReplaceMode = { bg = colour.orange, fg = colour.black, bold = true },
  StatusLineCommandMode = { bg = colour.magenta, fg = colour.black, bold = true },
  StatusLineTerminalMode = { bg = colour.cyan, fg = colour.black, bold = true },
  StatusLineModeNotFound = { bg = colour.grey, fg = colour.black, bold = true },
  StatusLineFileInfo = { bg = colour.black, fg = colour.white },
  StatusLineFileType = { bg = colour.black, fg = colour.white },
  StatusLine = { bg = colour.black, fg = colour.none },
  StatusLineNC = { bg = colour.black, fg = colour.black }, -- fg only makes it unequal to above, no practical purposes
}
my_nvim.util.set_highlight(hl)
-- }}}

-- statusline definition {{{
local modes = {
  ["n"] = { "NORMAL", "StatusLineNormalMode" },
  ["no"] = { "O-PENDING", "StatusLineNormalMode" },
  ["niI"] = { "(insert)", "StatusLineNormalMode" },
  ["niR"] = { "(replace)", "StatusLineNormalMode" },
  ["niV"] = { "(vreplace)", "StatusLineNormalMode" },
  ["nt"] = { "N-TERMINAL", "StatusLineTerminalMode" },
  ["ntT"] = { "(terminal)", "StatusLineTerminalMode" },
  ["v"] = { "VISUAL", "StatusLineVisualMode" },
  ["vs"] = { "VISUAL", "StatusLineVisualMode" },
  ["V"] = { "V-LINE", "StatusLineVisualMode" },
  ["Vs"] = { "V-LINE", "StatusLineVisualMode" },
  [""] = { "V-BLOCK", "StatusLineVisualMode" },
  ["s"] = { "V-BLOCK", "StatusLineVisualMode" },
  ["s"] = { "SELECT", "StatusLineSelectMode" },
  ["S"] = { "S-LINE", "StatusLineSelectMode" },
  [""] = { "S-BLOCK", "StatusLineSelectMode" },
  ["i"] = { "INSERT", "StatusLineInsertMode" },
  ["ic"] = { "keyword completion", "StatusLineInsertMode" },
  ["ix"] = { "Ctrl-X mode", "StatusLineInsertMode" },
  ["R"] = { "REPLACE", "StatusLineReplaceMode" },
  ["Rc"] = { "keyword completion", "StatusLineReplaceMode" },
  ["Rx"] = { "Ctrl-X mode", "StatusLineReplaceMode" },
  ["Rv"] = { "V-REPLACE", "StatusLineReplaceMode" },
  ["Rvc"] = { "keyword completion", "StatusLineReplaceMode" },
  ["Rvx"] = { "Ctrl-X mode", "StatusLineReplaceMode" },
  ["c"] = { "COMMAND", "StatusLineCommandMode" },
  ["t"] = { "TERMINAL", "StatusLineTerminalMode" },
}

local getmode = function(code)
  if modes[code] == nil then
    return string.format("%%#StatusLineModeNotFound# %s", code)
  end
  return string.format("%%#%s# %s ", modes[code][2], modes[code][1])
end

local file_info = "%#StatusLineFileInfo# %f %m%r"

local function file_type()
  local filetype = vim.bo.filetype
  if filetype == "" then
    return ""
  end
  return string.format("%%#StatusLineFileType# %s ", filetype)
end

local position = function(code)
  local line = " %l/%L,%c"
  if modes[code] == nil then
    return string.format("%%#StatusLineModeNotFound# %s", line)
  end
  return string.format("%%#%s# %s ", modes[code][2], line)
end

-- it seems that customised dynamic statusline MUST be set via "%!v:lua..." ???
-- hence the following function is intentionally made global
function _G.active_statusline()
  local code = vim.api.nvim_get_mode().mode
  return string.format(
    "%s%s%%=%s%s",
    getmode(code),
    file_info,
    file_type(),
    position(code)
  )
end

local inactive_statusline = function()
  return "%=%#StatusLineFileInfo# %f"
end
-- }}}

-- statusline autocmd {{{
vim.api.nvim_create_augroup("statusline", { clear = true })
vim.api.nvim_create_autocmd({"BufEnter", "WinEnter"}, {
  group = "statusline",
  callback = function()
    if vim.bo.filetype == 'NvimTree' then
      vim.wo.statusline = ""
    else
      vim.wo.statusline = "%!v:lua.active_statusline()"
    end
  end
})

vim.api.nvim_create_autocmd({"BufLeave", "WinLeave"}, {
  group = "statusline",
  callback = function()
    if vim.bo.filetype == 'NvimTree' then
      vim.wo.statusline = ""
    else
      vim.wo.statusline = inactive_statusline()
    end
  end
})

-- for operator pending mode
-- https://github.com/vim/vim/issues/12012
vim.api.nvim_create_autocmd({"ModeChanged"}, {
  group = "statusline",
  command = "redrawstatus",
})
-- }}}
