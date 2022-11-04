return {
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
}
