local M = {}

-- colour: hex colour string e.g. '#ea6962'
-- increment: integer to change RGB components, negative for darkening
-- no safe guard here, increment should be sensible
-- e.g. light_black = lighten(colour.black, 5)
-- note e.g. decimal form of '#ea6962' is 15362402 which has nothing to do with 234,105,98
M.lighten = function(colour, increment)
  return string.gsub(colour, "#", "0x") + increment * 65793 -- 1 + 16^2 + 16^4
end

M.set_highlight = function(highlight)
  for group, spec in pairs(highlight) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

-- delete all buffers in the current tab
M.delete_all_bufs_in_current_tab = function()
  local buffers = vim.fn.tabpagebuflist()
  for _, buffer in ipairs(buffers) do
    vim.cmd("bd " .. buffer)
  end
end

return M
