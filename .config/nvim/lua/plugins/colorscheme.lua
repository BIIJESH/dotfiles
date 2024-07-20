return {
	{
		"folke/tokyonight.nvim",
		opts = {
			style = "night",
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			-- vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = {},

		config = function(_, opts)
			require("gruvbox").setup(opts)
			vim.o.background = "dark" -- or "light" for light mode
			-- vim.cmd([[colorscheme gruvbox]])
		end,
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme moonfly]])
		end,
	},
}
