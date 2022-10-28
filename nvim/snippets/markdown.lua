return {
    s({
        trig="link_url",
        name="markdown_link_url",
        dscr="Turn selected URL into Markdown link",
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
        name="markdown_bold",
        dscr="Embolden selected Markdown text",
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
        name="markdown_italics",
        dscr="Italicize selected Markdown text",
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
}
