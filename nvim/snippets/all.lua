local date = function() return {os.date('%Y-%m-%d')} end
local time = function() return {os.date('%H:%M %z')} end

return {
    s({
        trig="date",
        name="Date",
        dscr="Inserts the date in the format YYYY-MM-DD",
    }, {
        f(date, {}),
    }),
    s({
        trig="time",
        name="Time",
        dscr="Inserts the time in the format HH:MM Z",
    }, {
        f(time, {}),
    }),
}
