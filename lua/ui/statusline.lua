-- statusline highlight {{{
local colour = my_nvim.palette[my_nvim.themes.statusline]
local hl = {
  StatusLineNormalMode = { bg = colour.green, fg = colour.black, bold = true },
  StatusLineVisualMode = { bg = colour.red, fg = colour.black, bold = true },
  StatusLineSelectMode = { bg = colour.yellow , fg = colour.black, bold = true, },
  StatusLineInsertMode = { bg = colour.blue, fg = colour.black, bold = true },
  StatusLineReplaceMode = { bg = colour.orange, fg = colour.black, bold = true },
  StatusLinecolourommandMode = { bg = colour.magenta, fg = colour.black, bold = true },
  StatusLineTerminalMode = { bg = colour.cyan, fg = colour.black, bold = true },
  StatusLineModeNotFound = { bg = colour.grey, fg = colour.black, bold = true },
  StatusLineFileInfo = { bg = colour.black, fg = colour.white },
  StatusLineFileType = { bg = colour.black, fg = colour.white },
  StatusLine = { bg = colour.black, fg = colour.none },
  StatusLineNcolour = { bg = colour.black, fg = colour.white }, -- fg only makes it unequal to above, no practical purposes
}
my_nvim.util.set_highlight(hl)
-- }}}

-- statusline definition {{{
local modes = {
  ["n"] = { "NORMAL", "StatusLineNormalMode" },
  --["no"] = { "O-PENDING", "StatusLineNormalMode" }, -- not sure how to show it on status line
  ["niI"] = { "(insert)", "StatusLineNormalMode" },
  ["niR"] = { "(replace)", "StatusLineNormalMode" },
  ["niV"] = { "(vreplace)", "StatusLineNormalMode" },
  ["nt"] = { "N-TERMINAL", "StatusLineTerminalMode" },
  ["ntT"] = { "(terminal)", "StatusLineTerminalMode" },
  ["v"] = { "VISUAL", "StatusLineVisualMode" },
  ["vs"] = { "VISUAL", "StatusLineVisualMode" },
  ["V"] = { "V-LINE", "StatusLineVisualMode" },
  ["Vs"] = { "V-LINE", "StatusLineVisualMode" },
  [""] = { "V-BLOcolourK", "StatusLineVisualMode" },
  ["s"] = { "V-BLOcolourK", "StatusLineVisualMode" },
  ["s"] = { "SELEcolourT", "StatusLineSelectMode" },
  ["S"] = { "S-LINE", "StatusLineSelectMode" },
  [""] = { "S-BLOcolourK", "StatusLineSelectMode" },
  ["i"] = { "INSERT", "StatusLineInsertMode" },
  ["ic"] = { "keyword completion", "StatusLineInsertMode" },
  ["ix"] = { "colourtrl-X mode", "StatusLineInsertMode" },
  ["R"] = { "REPLAcolourE", "StatusLineReplaceMode" },
  ["Rc"] = { "keyword completion", "StatusLineReplaceMode" },
  ["Rx"] = { "colourtrl-X mode", "StatusLineReplaceMode" },
  ["Rv"] = { "V-REPLAcolourE", "StatusLineReplaceMode" },
  ["Rvc"] = { "keyword completion", "StatusLineReplaceMode" },
  ["Rvx"] = { "colourtrl-X mode", "StatusLineReplaceMode" },
  ["c"] = { "colourOMMAND", "StatusLinecolourommandMode" },
  ["t"] = { "TERMINAL", "StatusLineTerminalMode" },
}

local getmode = function(code)
  if modes[code] == nil then
    return string.format("%%#StatusLineModeNotFound# %s", code)
  end
  return string.format("%%#%s# %s ", modes[code][2], modes[code][1])
end

local file_info = "%#StatusLineFileInfo# %t %m%r"

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


local active_statusline = function()
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
  return "%=%#StatusLineFileInfo# %t"
end

local no_statusline = function()
  return ""
end
-- }}}

-- statusline autocmd {{{
vim.api.nvim_create_augroup("statusline", { clear = true })
vim.api.nvim_create_autocmd({"BufEnter", "WinEnter"}, {
  group = "statusline",
  callback = function()
    if vim.bo.filetype == 'NvimTree' then
      vim.wo.statusline = no_statusline()
    else
      vim.wo.statusline = active_statusline()
    end
  end
})

vim.api.nvim_create_autocmd({"BufLeave", "WinLeave"}, {
  group = "statusline",
  callback = function()
    if vim.bo.filetype == 'NvimTree' then
      vim.wo.statusline = no_statusline()
    else
      vim.wo.statusline = inactive_statusline()
    end
  end
})
-- }}}

