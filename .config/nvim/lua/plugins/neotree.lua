return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		opts = {
			window = {
				position = "left",
				width = 25,
			},
			filesystem = {
				filtered_items = {
					hide_by_pattern = { "*.class" }, -- Hide .class files
					hide_dotfiles = false,
				},
			},
		},
		keys = {
			{ "<leader>te", "<cmd>Neotree toggle reveal<CR>", desc = "Neotree" },
			{ "<leader>tb", "<cmd>Neotree toggle buffers<CR>", desc = "Buffers (Neotree)" },
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			{
				"ahmedkhalf/project.nvim",
				event = "VeryLazy",
				opts = {
					manual_mode = true,
				},
				main = "project_nvim",
				keys = {
					{ "<leader>tt", "<cmd>ProjectRoot<CR>", desc = "Project root" },
				},
			},
		},
		cmd = "Telescope",
		opts = {},
		config = function(_, opts)
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = { "%.class", "%.png", "%.jpg", "node_modules/.*", "venv/.*" },
					selection_caret = "󱞩 ",
					prompt_prefix = "   ",
					layout_strategy = "horizontal",
					layout_config = {
						preview_width = 0.65,
						horizontal = {
							size = {
								width = "95%",
								height = "95%",
							},
						},
					},
					border = false,
				},
			})
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("projects")
		end,
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Files" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Text" },
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
			{ "<leader>fc", "<cmd>Telescope commands<CR>", desc = "Commands" },
			{ "<leader>fC", "<cmd>Telescope colorscheme<CR>", desc = "Colorscheme" },
			{ "<leader>fp", "<cmd>Telescope projects<CR>", desc = "Projects" },
		},
	},
}
