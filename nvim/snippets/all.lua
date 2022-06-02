local date = function() return {os.date('%Y-%m-%d')} end

return {
    s({
        trig="date",
        name="Date",
        dscr="Inserts the date in the format YYYY-MM-DD",
    }, {
        f(date, {}),
    }),
}
