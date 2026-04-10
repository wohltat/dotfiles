--- @since 26.1.22

local selected_or_hovered = ya.sync(function()
	local tab, paths = cx.active, {}
	-- Falls Dateien ausgewählt sind, nimm diese
	for _, u in pairs(tab.selected) do
		paths[#paths + 1] = tostring(u)
	end
	-- Falls nichts ausgewählt ist, nimm die Datei unter dem Cursor
	if #paths == 0 and tab.current.hovered then
		paths[1] = tostring(tab.current.hovered.url)
	end
	return paths
end)

local function fail(s, ...)
	ya.notify({
		title = "chown",
		content = string.format(s, ...),
		level = "error",
		timeout = 5,
	})
end

return {
	entry = function()
		ya.emit("escape", { visual = true })

		local urls = selected_or_hovered()
		if #urls == 0 then
			return ya.notify({ title = "chown", content = "No file selected", level = "warn", timeout = 5 })
		end

		local value, event = ya.input({
			title = "chown:",
			pos = { "top-center", y = 3, w = 40 },
		})
		if event ~= 1 or value == "" then
			return
		end

		-- Wir erstellen den Befehl
		local cmd = Command("chown"):arg(value)

		-- Fix: Da es kein :args() gibt, fügen wir jeden Pfad einzeln hinzu
		for _, url in ipairs(urls) do
			cmd:arg(url)
		end

		local output, err = cmd:output()

		if not output then
			fail("Failed to run chown: %s", err)
		elseif not output.status.success then
			-- Bereinige die Fehlermeldung für die Anzeige
			local errMsg = output.stderr:gsub("^chown:%s*", "")
			fail("chown failed with stderr:\n%s", errMsg)
		else
			-- Optional: Erfolgsmeldung
			ya.notify({ title = "chown", content = "Owner changed successfully", level = "info", timeout = 3 })
		end
	end,
}
