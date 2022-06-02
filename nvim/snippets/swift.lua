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
    s("printv", { --print variable=<value>
        t("print(\""),
        rep(1),
        t("=\\("),
        i(1),
        t(")\")")
    }),
}
