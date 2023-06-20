return {
  s("config", fmt([[
  -- {} {{{{{{
  M.{} = function()
    local ok, {} = pcall(require, '{}')
    if not ok then
      return
    end
    {}
  end
  -- }}}}}}
  ]], {
    rep(1),
    rep(1),
    rep(1),
    i(1, "module"),
    i(0),
  })),

  s("snip", fmt([=[
  s("{}", fmt([[
  {}
  ]], {{
    {}
  }}))
  ]=], {
    i(1),
    i(2),
    i(0, "node"),
  })),

  s("plugin", fmt([[
  -- {} {{{{{{
  {{
    "{}",
    {}
  }}
  -- }}}}}}
  ]], {
    f(function(args, snip, _) return args[1][1]:match("[^/]+$") end, {1}),
    i(1, repo),
    i(0),
  })),

  s("hi", fmt([[
  M = {{}}
  M.highlight = function(C, D)
    return {{
      {} = {{ bg = {}, fg = {} }},
      {}
    }}
  end
  return M
  ]], {
    i(1, "group"),
    i(2),
    i(3),
    i(0),
  })),
}
