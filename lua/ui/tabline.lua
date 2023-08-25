-- draw tabline

-- tabline highlight {{{
local colour = my_nvim.palette[my_nvim.themes.tabline]
local hl = {
  TabLineSel = { bg = colour.red, fg = colour.black, bold = true },
  TabLine = { bg = colour.black, fg = colour.grey },
  TabLineFill = { link = "Hide" },
  TabLineSeparator = { link = "Hide" },
}
my_nvim.util.set_highlight(hl)
-- }}}

-- tabline definition {{{
function _G.tabline()
  local res = "%=" -- right aligned
  local totalTabs = vim.fn.tabpagenr("$")
  for i = 1, totalTabs do
    local hl_group = i == vim.fn.tabpagenr() and "%#TabLineSel#" or "%#TabLine#"
    if i ~= 1 then
      res = res .. "%#TabLineSeparator#" .. " "
    end
    res = res .. hl_group .. " " .. i .. " "
    -- for mouse click support, use item T
    --res = res .. hl_group .. '%' .. i .. 'T' .. ' ' .. i .. ' ' .. '%T'
  end
  return res
end

vim.opt.tabline = "%!v:lua.tabline()"
-- }}}

-- tabline autocmd {{{
vim.api.nvim_create_augroup("tabline", { clear = true })
vim.api.nvim_create_autocmd({ "TabEnter" }, {
  group = "tabline",
  callback = function()
    if vim.bo.filetype == "NvimTree" then
      -- from project.nvim, pwd cannot update when the current buffer is a tree buffer
      -- so go to the right of the tree buffer to update the tree root (caused by pwd updates)
      -- one caveat is that there should be a buffer to the right of the tree buffer, which is usually the case
      vim.cmd([[exe "normal!\<C-w>l"]])
    end
  end,
})
-- }}}
