vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
})
-- Hyprlang LSP
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.hl", "hypr*.conf" },
	callback = function()
		-- print(string.format("starting hyprls for %s", vim.inspect(event)))
		vim.lsp.start({
			name = "hyprlang",
			cmd = { "hyprls" },
			root_dir = vim.fn.getcwd(),
		})
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

