local lualine = require("lualine")
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
})
vim.api.nvim_create_autocmd("RecordingEnter", {
	callback = function()
		lualine.refresh({
			place = { "statusline" },
		})
	end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
	callback = function()
		-- This is going to seem really weird!
		-- Instead of just calling refresh we need to wait a moment because of the nature of
		-- `vim.fn.reg_recording`. If we tell lualine to refresh right now it actually will
		-- still show a recording occuring because `vim.fn.reg_recording` hasn't emptied yet.
		-- So what we need to do is wait a tiny amount of time (in this instance 50 ms) to
		-- ensure `vim.fn.reg_recording` is purged before asking lualine to refresh.
		local timer = vim.loop.new_timer()
		timer:start(
			50,
			0,
			vim.schedule_wrap(function()
				lualine.refresh({
					place = { "statusline" },
				})
			end)
		)
	end,
})
local function clear_all_recorded_registers()
	-- Clear alphabetical registers (a-z)
	for i = 97, 122 do
		vim.fn.execute("let @" .. string.char(i) .. '=""')
	end

	-- Clear numeric registers (0-9)
	for i = 48, 57 do
		vim.fn.execute("let @" .. string.char(i) .. '=""')
	end

	-- Clear special registers
	vim.fn.execute('let @"=""') -- Unnamed register
	vim.fn.execute('let @*=""') -- Clipboard register
end
clear_all_recorded_registers()
