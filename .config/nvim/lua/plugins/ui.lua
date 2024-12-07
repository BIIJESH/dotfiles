return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			highlights = {
				fill = {
					bg = {
						attribute = "bg",
						highlight = "bg",
					},
				},
			},
		},
		keys = {
			{ "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
			{ "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
			{ "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" },
			{ "<leader>br", "<cmd>BufferLineCloseRight<CR>", desc = "Close right buffer" },
			{ "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", desc = "Close left buffer" },
			{ "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
			{ "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "tokyonight",
					disabled_filetypes = {
						"alpha",
						"neo-tree",
						"Outline",
						"spectre_panel",
						"Trouble",
						"undotree",
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						"diff",
						"diagnostics",
						"branch",
					},
					lualine_c = { {
						"filename",
						path = 1,
					} },
				},
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
		},
		main = "ibl",
	},
}
