local ok, project = pcall(require, "project_nvim")
if not ok then
  return
end
-- highlight {{{
-- }}}

-- keymapping {{{
-- }}}

-- setup {{{
project.setup({
  manual_mode = false,
  detection_methods = { "lsp", "pattern" },
  patterns = { ".git" },
  silent_chdir = true,
  datapath = vim.fn.stdpath("data"),
  exclude_dirs = { "~/.local/share/*" },
})
-- }}}
