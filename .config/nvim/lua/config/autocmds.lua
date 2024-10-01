vim.cmd([[colorscheme tokyonight]])
vim.cmd([[colorscheme pywal16]])
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
vim.keymap.set("n", "<leader>ct", "", {
	noremap = true,
	silent = true,
	callback = function()
		newtag = vim.fn.input("Enter new tag name: ")
		local return_position = vim.api.nvim_win_get_cursor(0)

		vim.cmd([[execute "normal T<"]])

		local col = vim.api.nvim_win_get_cursor(0)[2]
		local char = vim.api.nvim_get_current_line():sub(col + 1, col + 1)

		if char == "/" then
			vim.cmd([[execute "normal %"]])
		end

		local current_position = vim.api.nvim_win_get_cursor(0)

		vim.cmd([[execute "normal %l"]])

		vim.cmd('execute "normal \\"_ciw' .. newtag .. '"')
		vim.api.nvim_win_set_cursor(0, current_position)

		vim.cmd('execute "normal \\"_ciw' .. newtag .. '"')

		vim.api.nvim_win_set_cursor(0, return_position)
	end,
})
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.ejs" },
	command = "set filetype=html",
})
vim.cmd([[
highlight NeoTreeNormal guifg=#D4D4D4 guibg=NONE
highlight NeoTreeNormalNC guifg=#D4D4D4 guibg=NONE
]])
