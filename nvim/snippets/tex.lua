function selected_text_exists()
  local ok, val = pcall(vim.api.nvim_buf_get_var, 0, "LUASNIP_SELECT_RAW");
  return ok;
end
function no_selected_text()
  return not selected_text_exists()
end
return {
    s({
        trig="bold",
        name="tex_bold_selection",
        dscr="Embolden selected TeX text",
    condition=no_selected_text,
    show_condition=no_selected_text,
    }, {
        t("\\textbf{"),
        f(function(_, snip)
            -- TM_SELECTED_TEXT is a table to account for multiline-selections.
            --          -- In this case only the first line is inserted.
            return snip.env.TM_SELECTED_TEXT[1] or {}
        end, {}),
        t("}"),
        i(0),
    }),
    s({
        trig="italics",
        name="tex_italics_selection",
        dscr="Italicize selected TeX text",
    condition=no_selected_text,
    show_condition=no_selected_text,
    }, {
        t("\\emph{"),
        f(function(_, snip)
            -- TM_SELECTED_TEXT is a table to account for multiline-selections.
            --          -- In this case only the first line is inserted.
            return snip.env.TM_SELECTED_TEXT[1] or {}
        end, {}),
        t("}"),
        i(0),
    }),
  s({
    trig="bold",
    name="tex_bold_standalone",
    dscr="embolden text",
    condition=no_selected_text,
    show_condition=no_selected_text,
  }, {
      t("\\textbf{"),
      i(1),
      t("}"),
      i(0),
    }),
  s({
    trig="italics",
    name="tex_italics_standalone",
    dscr="italicize text",
    condition=no_selected_text,
    show_condition=no_selected_text,
  }, {
      t("\\emph{"),
      i(1),
      t("}"),
      i(0),
    }),
}
