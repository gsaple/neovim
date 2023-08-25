vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = vim.api.nvim_create_augroup("fmt", {}),
  pattern = { "*.html", "*.js", "*.css", "*.scss" },
  command = "FormatWrite",
})

local util = require("formatter.util")

require("formatter").setup({
  -- Enable or disable logging
  logging = false,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = {
      function()
        if util.get_current_buffer_file_name() == "special.lua" then
          return nil
        end
        return {
          exe = "stylua",
          args = {
            "--indent-type Spaces",
            "--indent-width 2",
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end,
    },

    html = { require("formatter.defaults.prettierd") },
    css = { require("formatter.defaults.prettierd") },
    scss = { require("formatter.defaults.prettierd") },
    javascript = { require("formatter.defaults.prettierd") },
    sh = { require("formatter.filetypes.sh").shfmt },

    -- any filetype
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
})
