return {
	{
		"stevearc/oil.nvim",
		lazy = true,
		event = "VimEnter",
		config = function()
			local oil = require("oil")
			oil.setup({
				columns = { "icon" },
				keymaps = {
					["C-h"] = false,
					["M-h"] = "actions.select_split",
				},
				view_options = {
					show_hidden = true,
				},
				persistent = true,
				float = {
					padding = 2,
					max_width = 60,
					max_height = 16,
					border = "rounded",
					win_options = {
						winblend = 0,
					},
					get_win_title = nil,
					preview_split = "auto",
				},
			})
			-- Define the toggle float keymap within the config
			vim.keymap.set("n", "<leader>of", "<cmd>Oil<cr>", { desc = "Open parent dir" })
			vim.keymap.set("n", "-", require("oil").toggle_float, { desc = "Toggle Oil Float" })
		end,
		-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "BufReadPre",
		cmd = "FzfLua",
		opts = {},
		config = function(_, opts)
			require("fzf-lua").setup({
				keymap = {
					fzf = {
						["tab"] = "down",
						["shift-tab"] = "up",
					},
				},
				winopts = {
					height = 0.95,
					width = 0.95,
					preview = {
						layout = "horizontal",
						flip_columns = 0.65,
					},
					border = "rounded",
				},
				fzf_opts = {
					["--prompt"] = "   ",
					["--pointer"] = "󱞩 ",
				},
				files = {
					fd_opts = "--type f --hidden --follow --exclude .git --exclude node_modules --exclude venv",
				},
				grep = {
					rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case -g '!node_modules/*' -g '!venv/*'",
				},
				file_ignore_patterns = { "%.svg", "%.class", "%.png", "%.jpg" },
			})
		end,
		keys = {
			{ "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Files" },
			{ "<leader>fr", "<cmd>FzfLua oldfiles<CR>", desc = "Recent files" },
			{ "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Text" },
			{ "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Buffers" },
			{ "<leader>fh", "<cmd>FzfLua help_tags<CR>", desc = "Help tags" },
			{ "<leader>fc", "<cmd>FzfLua commands<CR>", desc = "Commands" },
			{ "<leader>fC", "<cmd>FzfLua colorschemes<CR>", desc = "Colorscheme" },
			{ "<leader>fp", "<cmd>FzfLua projects<CR>", desc = "Projects" },
		},
	},
}
