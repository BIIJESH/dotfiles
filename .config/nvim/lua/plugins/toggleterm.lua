return {
	"https://github.com/akinsho/toggleterm.nvim",
	keys = { [[\\]] },
  event = "VeryLazy",
	opts = {
		size = function(term)
			if term.direction == "horizontal" then
				return 20
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.5
			end
		end,
		vim.keymap.set("t", "<esc>", [[<C-\><C-n>]]),
		open_mapping = [[\\]],
		insert_mappings = false,
		terminal_mappings = true,
		hide_numbers = false,
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = "1",
		start_in_insert = true,
		persist_size = true,
		direction = "float",
		close_on_exit = true,
		shell = vim.o.shell,
		on_open = nil,
		on_close = nil,
	},
}
