---@diagnostic disable: undefined-global

-- Show user and hostname in top bar
Header:children_add(function()
	if ya.target_family() ~= "unix" then
		return ui.Line({})
	end
	return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
end, 500, Header.LEFT)

-- Show user and group in status bar
Status:children_add(function()
	local h = cx.active.current.hovered
	if h == nil or ya.target_family() ~= "unix" then
		return ui.Line({})
	end

	return ui.Line({
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		ui.Span(":"),
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		ui.Span(" "),
	})
end, 500, Status.RIGHT)

-- show symlink in status bar
function Status:name()
	local h = cx.active.current.hovered
	local linked = ""
	if h.link_to ~= nil then
		linked = " -> " .. tostring(h.link_to)
	end
	return ui.Line(" " .. h.name .. linked)
end

require("searchjump"):setup({
	opt_unmatch_fg = "#928374",
	opt_match_str_fg = "#000000",
	opt_match_str_bg = "#73AC3A",
	opt_lable_fg = "#EADFC8",
	opt_lable_bg = "#BA603D",
	opt_only_current = false, -- only search the current window
	opt_search_patterns = {}, -- demo:{"%.e%d+","s%d+e%d+"}
})

require("full-border"):setup()

require("current-size"):setup({
	folder_size_ignore = { "~", "/home", "/" },
})

-- ~/.config/yazi/init.lua
require("bookmarks"):setup({
	last_directory = { enable = true, persist = false },
	persist = "all",
	desc_format = "full",
	file_pick_mode = "parent",
	notify = {
		enable = false,
		timeout = 1,
		message = {
			new = "New bookmark '<key>' -> '<folder>'",
			delete = "Deleted bookmark in '<key>'",
			delete_all = "Deleted all bookmarks",
		},
	},
})
