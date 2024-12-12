require("full-border"):setup()
require("starship"):setup()


function Linemode:size_and_mtime()
    local year = os.date("%Y")
    local time = (self._file.cha.mtime or 0) // 1

    if time > 0 and os.date("%Y", time) == year then
        time = os.date("%m/%d %H:%M", time)
    else
        time = time and os.date("%m/%d  %Y", time) or ""
    end

    local size = self._file:size()
    return ui.Line(string.format("%s │ %s", size and ya.readable_size(size) or "-", time))
end
