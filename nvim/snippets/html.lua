return {
    s({
        trig="link_url",
        name="html_link_url",
        dscr="Turn selected URL into HTML link",
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
        name="html_bold",
        dscr="Embolden selected HTML text",
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
        name="html_italics",
        dscr="Italicize selected HTML text",
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
        name="html_link_title",
        dscr="Add link to selected HTML text",
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
}
