local M = {}

-- luasnip {{{
M.luasnip = function()
  local ok, luasnip = pcall(require, 'luasnip')
  if not ok then
    return
  end
  require('luasnip.loaders.from_lua').load({paths = '~/.config/nvim/lua/snippets/'})
  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip").config.set_config {
    enable_autosnippets = true,
    update_events = 'TextChanged,TextChangedI',
    region_check_events = 'InsertEnter',
  }
  vim.cmd([[imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' ]])
  vim.cmd([[smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>']])
  vim.cmd([[imap <silent><expr> <C-b> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-b>']])
  vim.cmd([[smap <silent><expr> <C-b> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-b>']])
  vim.keymap.set("i", "<C-n>", "<Plug>luasnip-next-choice", {})
  vim.keymap.set("s", "<C-n>", "<Plug>luasnip-next-choice", {})
  vim.keymap.set("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
  vim.keymap.set("s", "<C-p>", "<Plug>luasnip-prev-choice", {})
end
-- }}}

-- cmp {{{
M.cmp = function()
  local ok, cmp = pcall(require, 'cmp')
  if not ok then
    return
  end

  -- cmp icons {{{
  local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
  }
  --}}}

  -- global settings {{{
  cmp.setup({
     snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {
      completion = {
        border = 'rounded',
        winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,Search:None,CursorLine:CmpSel",
        --zindex = 1001,
        scrollbar = false,
      },
      documentation = cmp.config.disable,
    },
    mapping = {
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
      ['<CR>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), {"i", "c"}),
      --["<C-p>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), {"i", "c"}),
      --["<C-n>"] = cmp.mapping(cmp.mapping.scroll_docs(1), {"i", "c"}),
    },
    completion = {
      keyword_length = 3,
    },
    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
        return vim_item
      end,
    },
    enabled = function() return cmp_toggle end,
  })
  --- }}}

  -- filetype specific settings
  cmp.setup.filetype(cmp_general, {
    --completion = { autocomplete = false },
    sources = {
      { name = "buffer" },
      { name = "luasnip" },
    },
  })

  cmp.setup.filetype(cmp_spell, {
    sources = {
      { name = 'spell' },
      { name = 'buffer' },
    },
  })

  -- cmdline
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' },
      { name = 'cmdline' },
      }),
  })

end
-- }}}

-- treesitter {{{
M.treesitter = function()
  local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
  if not ok then
    return
  end

  treesitter.setup({
    ensure_installed = ts_parsers,
    highlight = {
      enable = false,
      --disable = { "html" },
    },
    indent = { enable = true, },
    rainbow = {
      enable = false,
      --list of languages you want to disable the plugin for
      disable = { "jsx", "cpp" }, 
      query = 'rainbow-parens',
      -- Highlight the entire buffer all at once
      strategy = require('ts-rainbow').strategy.global,
    },
  })
end
-- }}}

-- indent_blankline {{{
M.indent_blankline = function()
  local ok, indent_blankline = pcall(require, 'indent_blankline')
  if not ok then
    return
  end

  indent_blankline.setup({
		filetype_exclude = {
      "help",
      "terminal",
      "alpha",
      "packer",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "mason",
      "",
    },
    context_char = " ",
    show_current_context = true,
    use_treesitter = true,
    show_trailing_blankline_indent = false,
  })
  vim.cmd [[IndentBlanklineDisable]]
end
-- }}}

-- nvim-autopairs {{{
M.autopairs = function()
  local ok, autopairs = pcall(require, 'nvim-autopairs')
  if not ok then
    return
  end

  autopairs.setup({
    disable_filetype = { "TelescopePrompt", "vim" },
    fast_wrap = {},
  })
end
-- }}}

-- colorizer {{{
M.colorizer = function()
  local ok, colorizer = pcall(require, 'colorizer')
  if not ok then
    return
  end

  colorizer.setup({
    '*'; --filetypes
    DEFAULT_OPTIONS = {
      RGB      = true;         -- #RGB hex codes
      RRGGBB   = true;         -- #RRGGBB hex codes
      names    = true;         -- "Name" codes like Blue
      RRGGBBAA = false;        -- #RRGGBBAA hex codes
      rgb_fn   = false;        -- CSS rgb() and rgba() functions
      hsl_fn   = false;        -- CSS hsl() and hsla() functions
      css      = false;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn   = false;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
      mode     = 'background'; -- Set the display mode.
    },
  })
end
-- }}}

-- telescope {{{
M.telescope = function()
  local ok, telescope = pcall(require, 'telescope')
  if not ok then
    return
  end
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
end
--- }}}

-- which-key {{{
M.which_key = function()
  local ok, which_key = pcall(require, 'which-key')
  if not ok then
    return
  end

  which_key.setup({
    plugins = {
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false, -- default bindings on <c-w>
        nav = false, -- misc bindings to work with windows
        z = false, -- bindings for prefixed with z
        g = false, -- bindings for prefixed with g
      }
    },
    icons = {
      group = " ",
    },
    popup_mappings = {
      scroll_down = '<c-j>',
      scroll_up = '<c-k>',
    },
    window = {
      border = "none", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
    ignore_missing = true,
    layout = {
      height = { min = 4, max = 10 }, -- min and max height of the columns
      width = { min = 20, max = 90 }, -- min and max width of the columns
      spacing = 10, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    disable = {
      buftypes = {"prompt"},
      filetypes = { "TelescopePrompt", "NvimTree" },
    },
    show_help = false,
    show_keys = false,
  })

  local map = require('core.keyregister')
  --local opts = {
  --  mode = "n", -- normal mode
  --  prefix = "<>",
  --  buffer = nil, -- Specify a buffer number for buffer local mappings
  --  silent = true, -- use `silent` when creating keymaps
  --  noremap = true, -- use `noremap` when creating keymaps
  --  nowait = false, -- use `nowait` when creating keymaps
  --}
  which_key.register(map, { prefix = "<leader>" })
  which_key.register({
    ["`"] = "which_key_ignore",
    ["@"] = "which_key_ignore",
    ['"'] = "which_key_ignore",
    ["'"] = "which_key_ignore",
  })
end
-- }}}

-- nvim-tree {{{
M.nvim_tree = function()
  local ok, nvim_tree = pcall(require, 'nvim-tree')
  if not ok then
    return
  end

  nvim_tree.setup({
    respect_buf_cwd = true,
    sync_root_with_cwd = true,
    hijack_cursor = true,
    remove_keymaps = { "<Tab>", "<C-e>", "<CR>", "<2-LeftMouse>", "<2-RightMouse>", "<BS>", "o", "O", "a", "E", "-", "s", "g?" },
    view = {
      mappings = {
        list = {
          { key = "l", action = "edit" },
          { key = "h", action = "close_node" },
          { key = "<C-f>", action = "create" },
          { key = "u", action = "dir_up" },
          { key = "?", action = "toggle_help" },
        },
      },
      --adaptive_size = true,
      float = {
        enable = false,
        open_win_config = function()
          return {
            border = 'rounded',
            relative = 'editor',
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
      icons = { git_placement = 'after' },
      root_folder_label = ":~:s?$?//?",
      indent_markers = { enable = true },
    },
    filters = {
      custom = { "^\\.git" },
      exclude = {".gitignore"},
    },
    actions = {
      file_popup = {
        open_win_config = {
          row = 0,
          col = 20,
          relative = 'cursor',
          border = 'rounded',
          style = 'minimal'
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
end
-- }}}

-- bufferline {{{
M.bufferline = function()
  local ok, bufferline = pcall(require, 'bufferline')
  if not ok then
    return
  end

  bufferline.setup({
    options = {
      themable = true, -- allow customise UI
      right_mouse_command = "Bdelete! %d",
      separator_style = { ' ', ' ' },
      show_buffer_icons = false,
      indicator = { style = 'none' },
      show_buffer_close_icons = false,
      modified_icon = '[+]',
      offsets = {
        {
          filetype = "NvimTree",
          text = " File Explorer ",
          text_align = "center",
          highlight = "NvimTreeTitle",
          separator = false,
        },
      },
      custom_filter = function(buf_number, buf_numbers)
        local tab_num = 0
        for _ in pairs(vim.api.nvim_list_tabpages()) do
          tab_num = tab_num + 1
        end
        if tab_num > 1 then
          if vim.api.nvim_buf_get_name(buf_number):find(vim.fn.getcwd(), 0, true) then
            return true
          end
        else
          return true
        end
      end,
    },
  })
end
-- }}}

-- project {{{
M.project = function()
  local ok, project = pcall(require, 'project_nvim')
  if not ok then
    return
  end

  project.setup({
    manual_mode = false,
    detection_methods = { "lsp", "pattern" },
    patterns = { ".git" },
    silent_chdir = true,
    datapath = vim.fn.stdpath("data"),
  })
end
-- }}}

-- toggleterm {{{
M.toggleterm = function()
  local ok, toggleterm = pcall(require, 'toggleterm')
  if not ok then
    return
  end
  toggleterm.setup({
    open_mapping = [[<C-\>]],
    shade_terminals = false,
    direction = 'float',
    float_opts = {
      border = 'double',
    },
    highlights = {
      -- floatwindow only
      FloatBorder = {
        link = 'FloatBorder',
      },
    },
  })
end
-- }}}

-- vimtex {{{
M.vimtex = function()
  vim.g.vimtex_mappings_enabled = 0
  vim.g.vimtex_complete_enabled = 0
  vim.g.vimtex_view_method = 'zathura'
  vim.g.vimtex_quickfix_ignore_filters = {
    'Underfull \\\\hbox',
    'Overfull \\\\hbox',
  }
end
-- }}}

-- mason {{{
M.mason = function()
  local ok, mason = pcall(require, 'mason')
  if not ok then
    return
  end
  mason.setup({})
end
-- }}}

return M
