local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

-- highlight {{{
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md
local colour = my_nvim.palette[my_nvim.themes.treesitter]
local dark_blue = my_nvim.util.lighten(colour.blue, -40)
local hl = {
  --TODO: remove all links, define own colour groups
  --Misc
  ["@comment"] = { link = "Comment" },
  ["@error"] = { link = "Error" },
  ["@none"] = { bg = colour.none, fg = colour.none },
  ["@preproc"] = { link = "PreProc" },
  ["@define"] = { link = "PreProc" },
  ["@operator"] = { link = "operator" },

  --Punctuation
  ["@punctuation.delimiter"] = { link = "Delimiter" },
  ["@punctuation.bracket"] = { bg = colour.none, fg = colour.orange, bold = true },
  ["@punctuation.special"] = { link = "Delimiter" },

  --Literals
  ["@string"] = { link = "String" },
  ["@string.regex"] = { link = "String" },
  ["@string.escape"] = { link = "Special" },
  ["@string.special"] = { link = "Special" },
  ["@character"] = { link = "String" },
  ["@character.special"] = { link = "Special" },
  ["@boolean"] = { link = "Keyword" },
  ["@number"] = { link = "Number" },
  ["@float"] = { link = "Number" },

  --Functions
  ["@function"] = { link = "Function" },
  ["@function.builtin"] = { link = "Function" },
  ["@function.call"] = { link = "Function" },
  ["@function.macro"] = { link = "Function" },
  ["@method"] = { link = "Function" },
  ["@method.call"] = { link = "Function" },
  ["@constructor"] = { link = "Function" },
  ["@parameter"] = { link = "Identifier" },

  --Keywords
  ["@keyword"] = { link = "Keyword" },
  ["@keyword.function"] = { link = "Keyword" },
  ["@keyword.operator"] = { link = "Operator" },
  ["@keyword.return"] = { link = "Keyword" },
  ["@conditional"] = { link = "Conditional" },
  ["@conditional.ternary"] = { link = "Conditional" },
  ["@repeat"] = { link = "Repeat" },
  ["@debug"] = { link = "Keyword" },
  ["@label"] = { link = "Label" },
  ["@include"] = { link = "Include" },
  ["@exception"] = { link = "Exception" },

  --Types
  ["@type"] = { link = "Type" },
  ["@type.builtin"] = { link = "Type" },
  ["@type.definition"] = { link = "Type" },
  ["@type.qualifier"] = { link = "Type" },
  ["@storageclass"] = { link = "StorageClass" },
  ["@attribute"] = { link = "Type" },
  ["@field"] = { link = "Type" },
  ["@property"] = { link = "Type" },

  --Identifiers
  ["@variable"] = { link = "Identifier" },
  ["@variable.builtin"] = { link = "Identifier" },
  ["@constant"] = { link = "Constant" },
  ["@constant.builtin"] = { link = "Constant" },
  ["@constant.macro"] = { link = "Constant" },
  ["@namespace"] = { link = "Identifier" },
  ["@symbol"] = { link = "Identifier" },

  --Tags
  ["@tag"] = { link = "Statement" },
  ["@tag.attribute"] = { link = "@attribute" },
  ["@tag.delimiter"] = { bg = colour.none, fg = dark_blue, bold = true },

  --TODO: Text, Spell
}
my_nvim.util.set_highlight(hl)
-- }}}

-- keymapping {{{
-- }}}

-- setup {{{
treesitter.setup({
  ensure_installed = my_nvim.parsers,
  highlight = {
    enable = false,
    disable = { "html" },
  },
  indent = { enable = true },
  rainbow = {
    enable = false,
    --list of languages you want to disable the plugin for
    disable = { "jsx", "html" },
    query = "rainbow-parens",
    -- Highlight the entire buffer all at once
    strategy = require("ts-rainbow").strategy.global,
  },
})
-- }}}
