-- Define a function to configure aerial.nvim and its keymaps
local function setup_aerial()
	-- Plugin setup
	require("aerial").setup({
		-- Optionally use on_attach to set keymaps when aerial has attached to a buffer
		on_attach = function(bufnr)
			-- Jump forwards/backwards with '{' and '}'
			vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
			vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
		end,
		layout = {
			max_width = { 40, 0.2 },
			width = nil,
			min_width = 10,
		},
		default_direction = "prefer_float",
		filter_kind = {
			"Class",
			"Constructor",
			"Enum",
			"Function",
			"Interface",
			"Module",
			"Method",
			"Struct",
		},
		resize_to_content = true,
	})

	-- Keymap to toggle aerial
	vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
end

-- Return all plugins at once
return {
	{
		"stevearc/aerial.nvim",
		config = setup_aerial,
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	-- Add other plugins here as needed
	-- {
	--     "another/plugin",
	--     config = function()
	--         -- Plugin configuration
	--     end,
	-- },
}
