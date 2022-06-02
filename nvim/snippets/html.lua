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
}
