M = {}
M.highlight = function(C, D)
  return {
  --Misc
    ['@comment'] = { link = 'Comment' },
    ['@error'] = { link = 'Error' },
    ['@none'] = { bg = C.none, fg = C.none },
    ['@preproc'] = { link = 'PreProc' },
    ['@define'] = { link = 'PreProc' },
    ['@operator'] = { link = 'operator' },

  --Punctuation
    ['@punctuation.delimiter'] = { link = 'Delimiter' },
    ['@punctuation.bracket'] = { bg = C.none, fg = C.orange, bold = true },
    ['@punctuation.special'] = { link = 'Delimiter' },

  --Literals
    ['@string'] = { link = 'String' },
    ['@string.regex'] = { link = 'String' },
    ['@string.escape'] = { link = 'Special' },
    ['@string.special'] = { link = 'Special' },
    ['@character'] = { link = 'String' },
    ['@character.special'] = { link = 'Special' },
    ['@boolean'] = { link = 'Keyword' },
    ['@number'] = { link = 'Number' },
    ['@float'] = { link = 'Number' },

  --Functions
    ['@function'] = { link = 'Function' },
    ['@function.builtin'] = { link = 'Function' },
    ['@function.call'] = { link = 'Function' },
    ['@function.macro'] = { link = 'Function' },
    ['@method'] = { link = 'Function' },
    ['@method.call'] = { link = 'Function' },
    ['@constructor'] = { link = 'Function' },
    ['@parameter'] = { link = 'Identifier' },

  -- Keywords
    ['@keyword'] = { link = 'Keyword' },
    ['@keyword.function'] = { link = 'Keyword' },
    ['@keyword.operator'] = { link = 'Operator' },
    ['@keyword.return'] = { link = 'Keyword' },
    ['@conditional'] = { link = 'Conditional' },
    ['@conditional.ternary'] = { link = 'Conditional' },
    ['@repeat'] = { link = 'Repeat' },
    ['@debug'] = { link = 'Keyword' },
    ['@label'] = { link = 'Label' },
    ['@include'] = { link = 'Include' },
    ['@exception'] = { link = 'Exception' },

  -- Types
    ['@type'] = { link = 'Type' },
    ['@type.builtin'] = { link = 'Type' },
    ['@type.definition'] = { link = 'Type' },
    ['@type.qualifier'] = { link = 'Type' },
    ['@storageclass'] = { link = 'StorageClass' },
    ['@attribute'] = { link = 'Type' },
    ['@field'] = { link = 'Type' },
    ['@property'] = { link = 'Type' },
  
  --Identifiers
    ['@variable'] = { link = 'Identifier' },
    ['@variable.builtin'] = { link = 'Identifier' },
    ['@constant'] = { link = 'Constant' },
    ['@constant.builtin'] = { link = 'Constant' },
    ['@constant.macro'] = { link = 'Constant' },
    ['@namespace'] = { link = 'Identifier' },
    ['@symbol'] = { link = 'Identifier' },

  --Tags
    ['@tag'] = { link = 'Statement' },
    ['@tag.attribute'] = { link = '@attribute' },
    ['@tag.delimiter'] = { bg = C.none, fg = D.dark_blue, bold = true },

  -- TODO: Text, Spell 
  }
end
return M
