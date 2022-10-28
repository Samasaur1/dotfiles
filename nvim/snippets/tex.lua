return {
    s({
        trig="bold",
        name="tex_bold",
        dscr="Embolden selected TeX text",
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
        name="tex_italics",
        dscr="Italicize selected TeX text",
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
}
