function selected_text_exists()
  local ok, val = pcall(vim.api.nvim_buf_get_var, 0, "LUASNIP_SELECT_RAW");
  return ok;
end
function no_selected_text()
  return not selected_text_exists()
end
return {
  s({
    trig="link_url",
    name="html_link_url_selection",
    dscr="Turn selected URL into HTML link",
    condition=selected_text_exists,
    show_condition=selected_text_exists,
  }, {
      t('<a href="'),
      f(function(_, snip)
        -- TM_SELECTED_TEXT is a table to account for multiline-selections.
        --          -- In this case only the first line is inserted.
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      t('">'),
      i(1),
      t("</a>"),
      i(0),
    }),
  s({
    trig="bold",
    name="html_bold_selection",
    dscr="Embolden selected HTML text",
    condition=selected_text_exists,
    show_condition=selected_text_exists,
  }, {
      t("<strong>"),
      f(function(_, snip)
        -- TM_SELECTED_TEXT is a table to account for multiline-selections.
        --          -- In this case only the first line is inserted.
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      t("</strong>"),
      i(0),
    }),
  s({
    trig="italics",
    name="html_italics_selection",
    dscr="Italicize selected HTML text",
    condition=selected_text_exists,
    show_condition=selected_text_exists,
  }, {
      t("<em>"),
      f(function(_, snip)
        -- TM_SELECTED_TEXT is a table to account for multiline-selections.
        --          -- In this case only the first line is inserted.
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      t("</em>"),
      i(0),
    }),
  s({
    trig="link_title",
    name="html_link_title_selection",
    dscr="Add link to selected HTML text",
    condition=selected_text_exists,
    show_condition=selected_text_exists,
  }, {
      t('<a href="'),
      i(1),
      t('">'),
      f(function(_, snip)
        -- TM_SELECTED_TEXT is a table to account for multiline-selections.
        --          -- In this case only the first line is inserted.
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      t("</a>"),
      i(0),
    }),
  s({
    trig="link",
    name="html_link_standalone",
    dscr="Create link",
    condition=no_selected_text,
    show_condition=no_selected_text,
  }, {
      t('<a href="'),
      i(2, "link URL"),
      t('">'),
      i(1, "link title"),
      t("</a>"),
      i(0),
    }),
  s({
    trig="bold",
    name="html_bold_standalone",
    dscr="Embolden text",
    condition=no_selected_text,
    show_condition=no_selected_text,
  }, {
      t("<strong>"),
      i(1),
      t("</strong>"),
      i(0),
    }),
  s({
    trig="italics",
    name="html_italics_standalone",
    dscr="Italicize text",
    condition=no_selected_text,
    show_condition=no_selected_text,
  }, {
      t("<em>"),
      i(1),
      t("</em>"),
      i(0),
    }),
}
