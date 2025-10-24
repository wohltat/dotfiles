local M = {}

function M:peek(job)
	-- Get the thumbnail path from find-thumbnail
	local child = Command("find-thumbnail"):arg(tostring(job.file.url)):stdout(Command.PIPED):spawn()

	if not child then
		return
	end

	local output = child:wait_with_output()
	if not output or output.status.code ~= 0 then
		return
	end

	local thumbnail_path = output.stdout:gsub("%s+$", "")

	if thumbnail_path ~= "" then
		ya.image_show(Url(thumbnail_path), job.area)
		ya.preview_widgets(job, {})
	end
end

function M:seek() end

return M
