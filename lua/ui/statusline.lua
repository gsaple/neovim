M = {}

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


M.active_statusline = function()
  local code = vim.api.nvim_get_mode().mode
  return string.format(
    "%s%s%%=%s%s",
    getmode(code),
    file_info,
    file_type(),
    position(code)
  )
end

M.inactive_statusline = function()
  return "%#StatusLineFileInfo# %t"
end

M.no_statusline = function()
  return "  %=%l/%L"
end

return M
