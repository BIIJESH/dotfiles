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
		event = "BufEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local function get_recording_key()
				local recording_register = vim.fn.reg_recording()
				return recording_register ~= "" and ("Recording:@" .. recording_register) or ""
			end

			require("lualine").setup({
				options = {
					theme = "moonfly",
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
						{
							"filename",
							file_status = true, -- displays file status (readonly status, modified status)
							path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
						},
					},
					lualine_c = { -- Bottom section
						get_recording_key, -- Include the custom function directly
					},
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
