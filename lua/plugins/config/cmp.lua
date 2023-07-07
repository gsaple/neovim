local ok, cmp = pcall(require, 'cmp')
if not ok then
  return
end

-- highlight {{{
local colour = my_nvim.palette[my_nvim.themes.cmp]
local light_black = my_nvim.util.lighten(colour.black, 5)
local hl = {
  CmpSel = { bg = light_black, fg = colour.none },
  CmpItemAbbr = { bg = colour.none, fg = colour.white },
  CmpItemAbbrDeprecated = { bg = colour.none, fg = colour.grey, strikethrough = true },
  CmpItemAbbrMatch = { bg = colour.none, fg = colour.orange },
  CmpItemAbbrMatchFuzzy = { link = 'CmpItemAbbrMatch' },
  CmpItemKindClass = { bg = colour.none, fg = colour.yellow },
  CmpItemKindColor = { bg = colour.none, fg = colour.red },
  CmpItemKindConstant = { bg = colour.none, fg = colour.magenta },
  CmpItemKindConstructor = { bg = colour.none, fg = colour.cyan },
  CmpItemKindEnum = { link = 'CmpItemKindClass' },
  CmpItemKindEnumMember = { link = 'CmpItemKindClass' },
  CmpItemKindEvent = { link = 'CmpItemAbbrMatch' },
  CmpItemKindField = { link = 'CmpItemKindClass' },
  CmpItemKindFile = { bg = colour.none, fg = colour.cyan },
  CmpItemKindFolder = { link = 'CmpItemKindFile' },
  CmpItemKindFunction = { link = 'CmpItemKindConstructor' },
  CmpItemKindInterface = { link = 'CmpItemKindClass' },
  CmpItemKindKeyword = { link = 'CmpItemKindColor' },
  CmpItemKindMethod = { link = 'CmpItemKindConstructor' },
  CmpItemKindModule = { bg = colour.none, fg = colour.blue },
  CmpItemKindOperator = { link = 'CmpItemKindColor' },
  CmpItemKindProperty = { link = 'CmpItemKindClass' },
  CmpItemKindReference = { link = 'CmpItemKindClass' },
  CmpItemKindSnippet = { link = 'CmpItemKindColor' },
  CmpItemKindStruct = { link = 'CmpItemKindClass' },
  CmpItemKindText = { link = 'CmpBorder' },
  CmpItemKindTypeParameter = { link = 'CmpItemKindModule' },
  CmpItemKindUnit = { link = 'CmpItemKindConstant' },
  CmpItemKindValue = { link = 'CmpItemKindConstant' },
  CmpItemKindVariable = { link = 'CmpItemKindModule' },
}
my_nvim.util.set_highlight(hl)
-- }}}

-- keymapping {{{
-- }}}

-- setup {{{
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
      winhighlight = "Normal:NormalFloat,CursorLine:CmpSel",
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
  enabled = function() return my_nvim.cmp.toggle end,
})
--- }}}

-- filetype specific settings
cmp.setup.filetype(my_nvim.ft_trigger, {
  --completion = { autocomplete = false },
  sources = {
    { name = "buffer" },
    { name = "luasnip" },
  },
})

cmp.setup.filetype(my_nvim.cmp.spell_trigger, {
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
-- }}}
