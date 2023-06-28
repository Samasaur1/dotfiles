function selected_text_exists()
  local ok, val = pcall(vim.api.nvim_buf_get_var, 0, "LUASNIP_SELECT_RAW");
  return ok;
end
function no_selected_text()
  return not selected_text_exists()
end
return {
  s({
    trig="tern",
    name="Ternary operator",
    dscr="Inserts a ternary expression",
  }, {
      i(1),
      t(" ? "),
      i(2),
      t(" : "),
      i(0),
    }),
  s({
    trig="guard-let",
    name="guard-let",
    dscr="Inserts a guard-let statement",
  }, {
      t("guard let "),
      i(1),
      t(" = "),
      i(2),
      t({" else {", "\t"}),
      i(3),
      t({"", "}", ""}),
      i(0),
    }),
  s({
    trig="guard-sta",
    name="guard",
    dscr="Inserts a guard statement",
  }, {
      t("guard "),
      i(1),
      t({" else {", "\t"}),
      i(2),
      t({"", "}", ""}),
      i(0),
    }),
  s({
    trig="printv",
    name="printv-selection",
    condition=selected_text_exists,
    show_condition=selected_text_exists,
    dscr="Print <selected variable>=<value>",
  }, {
      t('print("'),
      f(function(_, snip)
        -- TM_SELECTED_TEXT is a table to account for multiline-selections.
        --          -- In this case only the first line is inserted.
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      t('=\\('),
      f(function(_, snip)
        -- TM_SELECTED_TEXT is a table to account for multiline-selections.
        --          -- In this case only the first line is inserted.
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      t(')")')
    }),
  s({
    trig="printv",
    name="printv-standalone",
    condition=no_selected_text,
    show_condition=no_selected_text,
    dscr="Print <type here>=<value>",
  }, {
      t("print(\""),
      rep(1),
      t("=\\("),
      i(1),
      t(")\")")
    }),
  s({
    trig="print",
    name="print-selection",
    dscr="Print 'selected variable'",
  }, {
      t('print('),
      f(function(_, snip)
        -- TM_SELECTED_TEXT is a table to account for multiline-selections.
        --          -- In this case only the first line is inserted.
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      t(')')
    }),
  s({
    trig="dump",
    name="dump-selection",
    dscr="Dump 'selected variable'",
  }, {
      t('dump('),
      f(function(_, snip)
        -- TM_SELECTED_TEXT is a table to account for multiline-selections.
        --          -- In this case only the first line is inserted.
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      t(')')
    }),
  require("luasnip.extras.postfix").postfix(".if", {
    t("if "),
    l(l.POSTFIX_MATCH),
    t({" {", "\t"}),
    i(1),
    t({"", "}", ""}),
    i(0)
  }),
  require("luasnip.extras.postfix").postfix(".printv", {
    t("print(\""),
    l(l.POSTFIX_MATCH),
    t("=\\("),
    l(l.POSTFIX_MATCH),
    t(")\")"),
    i(0)
  }),
}
