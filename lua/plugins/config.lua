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

  --- generated on_attach {{{
  local function on_attach(bufnr)
    local api = require('nvim-tree.api')
  
    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
  
    -- BEGIN_DEFAULT_ON_ATTACH
    vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
    vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
    vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
    vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
    vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
    vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
    vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
    vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
    vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
    vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
    vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
    vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
    vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))
    vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
    vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
    vim.keymap.set('n', 'bd',    api.marks.bulk.delete,                 opts('Delete Bookmarked'))
    vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
    vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
    vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
    vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
    vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
    vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
    vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
    vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'))
    vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
    vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
    vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
    vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
    vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
    vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))
    vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
    vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
    vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
    vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
    vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
    vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
    vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
    vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
    vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
    vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
    vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
    vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
    vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
    vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
    vim.keymap.set('n', 's',     api.node.run.system,                   opts('Run System'))
    vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))
    vim.keymap.set('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
    vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
    vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
    vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
    vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
    vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
    vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
    -- END_DEFAULT_ON_ATTACH
  
    -- You might tidy things by removing these along with their default mapping.
    vim.keymap.set('n', '<Tab>', '', { buffer = bufnr })
    vim.keymap.del('n', '<Tab>', { buffer = bufnr })
    vim.keymap.set('n', '<C-e>', '', { buffer = bufnr })
    vim.keymap.del('n', '<C-e>', { buffer = bufnr })
    vim.keymap.set('n', '<CR>', '', { buffer = bufnr })
    vim.keymap.del('n', '<CR>', { buffer = bufnr })
    vim.keymap.set('n', '<2-LeftMouse>', '', { buffer = bufnr })
    vim.keymap.del('n', '<2-LeftMouse>', { buffer = bufnr })
    vim.keymap.set('n', '<2-RightMouse>', '', { buffer = bufnr })
    vim.keymap.del('n', '<2-RightMouse>', { buffer = bufnr })
    vim.keymap.set('n', '<BS>', '', { buffer = bufnr })
    vim.keymap.del('n', '<BS>', { buffer = bufnr })
    vim.keymap.set('n', 'o', '', { buffer = bufnr })
    vim.keymap.del('n', 'o', { buffer = bufnr })
    vim.keymap.set('n', 'O', '', { buffer = bufnr })
    vim.keymap.del('n', 'O', { buffer = bufnr })
    vim.keymap.set('n', 'a', '', { buffer = bufnr })
    vim.keymap.del('n', 'a', { buffer = bufnr })
    vim.keymap.set('n', 'E', '', { buffer = bufnr })
    vim.keymap.del('n', 'E', { buffer = bufnr })
    vim.keymap.set('n', '-', '', { buffer = bufnr })
    vim.keymap.del('n', '-', { buffer = bufnr })
    vim.keymap.set('n', 's', '', { buffer = bufnr })
    vim.keymap.del('n', 's', { buffer = bufnr })
    vim.keymap.set('n', 'g?', '', { buffer = bufnr })
    vim.keymap.del('n', 'g?', { buffer = bufnr })
  
    -- custom keymap
    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', '<C-f>', api.fs.create, opts('Create'))
    vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  end
  ---}}}
  
  nvim_tree.setup({
    on_attach = on_attach,
    respect_buf_cwd = true,
    sync_root_with_cwd = true,
    hijack_cursor = true,
    view = {
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
  mason.setup({
    ui = { border = 'double' },
    icons = { package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
            },
  })
end
-- }}}

return M
