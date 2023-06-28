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
    name="markdown_link_url_selection",
    dscr="Turn selected URL into Markdown link",
    condition=selected_text_exists,
    show_condition=selected_text_exists,
  }, {
      t("["),
      i(1),
      t("]("),
      f(function(_, snip)
        -- TM_SELECTED_TEXT is a table to account for multiline-selections.
        --          -- In this case only the first line is inserted.
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      t(")"),
      i(0),
    }),
  s({
    trig="bold",
    name="markdown_bold_selection",
    dscr="Embolden selected Markdown text",
    condition=selected_text_exists,
    show_condition=selected_text_exists,
  }, {
      t("**"),
      f(function(_, snip)
        -- TM_SELECTED_TEXT is a table to account for multiline-selections.
        --          -- In this case only the first line is inserted.
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      t("**"),
      i(0),
    }),
  s({
    trig="italics",
    name="markdown_italics_selection",
    dscr="Italicize selected Markdown text",
    condition=selected_text_exists,
    show_condition=selected_text_exists,
  }, {
      t("_"),
      f(function(_, snip)
        -- TM_SELECTED_TEXT is a table to account for multiline-selections.
        --          -- In this case only the first line is inserted.
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      t("_"),
      i(0),
    }),
  s({
    trig="link_title",
    name="markdown_link_title_selection",
    dscr="Add link to selected Markdown text",
    condition=selected_text_exists,
    show_condition=selected_text_exists,
  }, {
      t("["),
      f(function(_, snip)
        -- TM_SELECTED_TEXT is a table to account for multiline-selections.
        --          -- In this case only the first line is inserted.
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      t("]("),
      i(1),
      t(")"),
      i(0),
    }),
  s({
    trig="link",
    name="markdown_link_standalone",
    dscr="Create link",
    condition=no_selected_text,
    show_condition=no_selected_text,
  }, {
      t("["),
      i(1, "link title"),
      t("]("),
      i(2, "link URL"),
      t(")"),
      i(0),
    }),
  s({
    trig="bold",
    name="markdown_bold_standalone",
    dscr="embolden text",
    condition=no_selected_text,
    show_condition=no_selected_text,
  }, {
      t("**"),
      i(1),
      t("**"),
      i(0),
    }),
  s({
    trig="italics",
    name="markdown_italics_standalone",
    dscr="italicize text",
    condition=no_selected_text,
    show_condition=no_selected_text,
  }, {
      t("_"),
      i(1),
      t("_"),
      i(0),
    }),
}
