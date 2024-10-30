function Linemode:size_and_mtime()
	local mtime = math.floor(self._file.cha.mtime or 0)
	local time = mtime and os.date("%F %T", mtime) or ""

	local size = self._file:size()
	return ui.Line(string.format("%s %s", size and ya.readable_size(size) or "-", time))
end
