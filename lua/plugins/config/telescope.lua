local ok, telescope = pcall(require, 'telescope')
if not ok then
  return
end

-- highlight {{{
local colour = my_nvim.palette[my_nvim.themes.telescope]
local light_black = my_nvim.util.lighten(colour.black, 5)
local hl = {
  TelescopeBorder = { bg = colour.black, fg = colour.black },
  TelescopeNormal = { bg = colour.black, fg = colour.white },
  TelescopePromptBorder = { bg = light_black, fg = light_black },
  TelescopePromptNormal = { bg = light_black, fg = colour.white },
  TelescopePromptPrefix = { bg = colour.none, fg = colour.green },
  TelescopePromptTitle = { bg = colour.red, fg = colour.black },
  TelescopeResultsTitle = { link = 'TelescopeBorder' },
  TelescopePreviewTitle = { bg = colour.green, fg = colour.black },
  TelescopePromptCounter = { link = 'TelescopePromptNormal' },
  TelescopeSelection = { link = 'TelescopePromptNormal' },
}
my_nvim.util.set_highlight(hl)
-- }}}

-- keymapping {{{
local opts = {noremap = true, silent = true}
local keymap = vim.keymap.set
keymap("n", "<S-f>", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<S-b>", "<cmd>lua require('telescope.builtin').buffers({only_cwd=true,ignore_current_buffer=true })<cr>", opts)
keymap("n", "<S-z>", "<cmd>NvimTreeClose<Bar>lua require('telescope').extensions.projects.projects{}<cr>", opts)
keymap("n", "<S-h>", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<S-l>", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
-- }}}

-- setup {{{
local action_layout = require("telescope.actions.layout")
local actions = require "telescope.actions"

telescope.setup({
  defaults = {
    -- appearance
    prompt_prefix = "   ",
    selection_caret = "  ",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        height = 0.8,
      },
    },
    --file_ignore_patterns = {"^node_modules/"},
    --better to put files to be ignored in a gitignore file, see https://github.com/nvim-telescope/telescope.nvim/issues/522
		mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-s>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_horizontal,
        ["<C-x>"] = actions.select_tab,
        ["<C-_>"] = actions.which_key, --<C-/>
        ["<Esc>"] = actions.close,
        ["<M-p>"] = action_layout.toggle_preview,
        ["<C-c>"] = false,
      },
      n = {
        ["q"] = actions.close,
        ["?"] = actions.which_key,
      }
    },
    preview = { hide_on_startup = true, treesitter = false },
  },
})
-- }}}
