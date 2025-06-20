local selected_or_hovered = ya.sync(function()
	local tab, paths = cx.active, {}
	for _, u in pairs(tab.selected) do
		paths[#paths + 1] = tostring(u)
	end
	if #paths == 0 and tab.current.hovered then
		paths[1] = tostring(tab.current.hovered.url)
	end
	return paths
end)

return {
	entry = function()
		ya.manager_emit("escape", { visual = true })

		local urls = selected_or_hovered()
		if #urls == 0 then
			return ya.notify({ title = "chown", content = "No file selected", level = "warn", timeout = 5 })
		end

		local value, event = ya.input({
			title = "chown:",
			position = { "top-center", y = 3, w = 40 },
		})
		if event ~= 1 then
			return
		end

		local status, err = Command("chown"):arg(value):args(urls):spawn():wait()
		if not status or not status.success then
			ya.notify({
				title = "chown",
				content = string.format(
					"chown with selected files failed, exit code %s",
					status and status.code or err
				),
				level = "error",
				timeout = 5,
			})
		end
	end,
}
