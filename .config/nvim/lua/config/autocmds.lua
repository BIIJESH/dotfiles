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
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	pattern = { "*.ejs" },
-- 	command = "set filetype=html",
-- })
