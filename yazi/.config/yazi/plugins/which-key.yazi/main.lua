--- @since 25.2.7
--- @sync entry

local function entry(self)
	local path = os.getenv("HOME") .. "/.config/yazi/keymap.toml"
	local file = io.open(path, "r")
	if not file then
		ya.notify("error", "Failed to open keymap.toml")
		return
	end

	ya.dbg("xxxxxxxx")
	local bindings = {}
	local current_section = nil

	for line in file:lines() do
		line = line:match("^%s*(.-)%s*$") -- trim

		local section = line:match("^%[(.-)%]$")
		if section then
			current_section = section
		else
			local key, action = line:match('^([%w%-_]+)%s*=%s*"(.-)"')
			if key and action and current_section then
				table.insert(bindings, string.format("[%s] %s → %s", current_section, key, action))
			end
		end
	end
	file:close()

	if #bindings == 0 then
		ya.notify("warn", "No keybindings found")
		return
	end

	local output = table.concat(bindings, "\n")
	if #output > 2000 then
		output = output:sub(1, 2000) .. "\n... (truncated)"
	end

	ya.notify({
		-- Title.
		title = "Hello, World! alsdfjdk",
		-- Content.
		content = output,
		-- Timeout.
		timeout = 6.5,
		-- Level, available values: "info", "warn", and "error", default is "info".
		level = "info",
	})

	ya.dbg("xxxxxxskjdflaksxx")
end

return { entry = entry }
