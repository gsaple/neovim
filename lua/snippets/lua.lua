return {
  s("config", fmt([[
  local ok, {} = pcall(require, '{}')
  if not ok then
    return
  end
  {}
  -- highlight {{{{{{
  -- }}}}}}

  -- setup {{{{{{
  -- }}}}}}

  -- keymapping {{{{{{
  -- }}}}}}
  ]], {
    rep(1),
    i(1, "module"),
    i(0),
  })),

  s("snip", fmt([=[
  s("{}", fmt([[
  {}
  ]], {{
    {}
  }})),{}
  ]=], {
    i(1),
    i(2),
    i(3, "node"),
    i(0),
  })),

  s("plugin", fmt([[
  -- {} {{{{{{
  {{
    "{}",
    config = function()
      {}
    end
  }},
  -- }}}}}}
  ]], {
    f(function(args, snip, _) return args[1][1]:match("[^/]+$") end, {1}),
    i(1, repo),
    i(0),
  })),

  s("fold", fmt([[
  -- {} {{{{{{
  {}
  -- }}}}}}
  ]], {
    i(1),
    i(0),
  })),

  s("highlight", fmt([[
  local colour = my_nvim.palette[my_nvim.themes.{}]
  local hl = {{
    {} = {{}},
  }}
  my_nvim.util.set_highlight(hl){}
  ]], {
    i(1, "component"),
    i(2, "group_name"),
    i(0),
  })),
}
