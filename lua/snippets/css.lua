return {
  s("css-reset", fmt([[
  *,
  *::before,
  *::after {{
    margin: 0;
    padding: 0;
    box-sizing: inherit;
  }}
  {}
  ]], {
    i(0),
  })),

  s("center-box", fmt([[
  margin: {}px auto;
  {}
  ]], {
    i(1, "number"),
    i(0),
  })),

  s("center-content", fmt([[
  display: flex;
  justify-content: center;
  align-items: center;
  {}
  ]], {
    i(0),
  })),
  s("fold", fmt([[
  /* {{{{{{ {} */
  /* }}}}}}*/{}
  ]], {
    i(1),
    i(0),
  })),
}


