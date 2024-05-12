return {
	{
		"folke/tokyonight.nvim",
		opts = {
			style = "night",
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"gbprod/nord.nvim",
		opts = {},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {},
	},
	{
		"tiagovla/tokyodark.nvim",
		opts = {
			-- custom options here
		},
		config = function(_, opts)
			require("tokyodark").setup(opts) -- calling setup is optional
			-- vim.cmd([[colorscheme tokyodark]])
		end,
	},
}
