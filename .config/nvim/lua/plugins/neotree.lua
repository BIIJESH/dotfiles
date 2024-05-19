return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",
		},
		cmd = "Neotree",
		opts = {
			window = {
				position = "left",
				width = 25,
				mappings = {
					["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
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
					selection_caret = "󱞩 ",
					prompt_prefix = "   ",
					layout_strategy = "vertical",
					layout_config = {
						vertical = {
							width = 0.9,
							height = 0.9,
							preview_height = 0.7,
						},
					},
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
	{
		"3rd/image.nvim",
		config = function()
			-- default config
			require("image").setup({
				event = { "BufEnter" },
				backend = "kitty",
				integrations = {
					markdown = {
						enabled = true,
						clear_in_insert_mode = false,
						download_remote_images = true,
						only_render_image_at_cursor = false,
						filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
					},
					neorg = {
						enabled = true,
						clear_in_insert_mode = false,
						download_remote_images = true,
						only_render_image_at_cursor = false,
						filetypes = { "norg" },
					},
				},
				max_width = nil,
				max_height = nil,
				max_width_window_percentage = nil,
				max_height_window_percentage = 50,
				window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
				window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
				editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
				tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
				hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
			})
		end,
	},
}
