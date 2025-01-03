-- Hyprlang LSP
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.hl", "hypr*.conf" },
	callback = function()
		vim.lsp.start({
			name = "hyprlang",
			cmd = { "hyprls" },
			root_dir = vim.fn.getcwd(),
		})
	end,
})
vim.keymap.set("n", "<leader>ct", "", {
	noremap = true,
	silent = true,
	callback = function()
		local newtag = vim.fn.input("Enter new tag name: ")
		local return_position = vim.api.nvim_win_get_cursor(0)
		vim.cmdexecute("normal T")

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

vim.api.nvim_set_keymap("n", "<leader>bb", ":Gitsigns blame<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lb", ":Gitsigns blame_line<CR>", { noremap = true, silent = true })
