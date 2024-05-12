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
		event = "VimEnter", -- Use a suitable event such as VimEnter to ensure lualine initializes correctly
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- Function to get the current recording key
			local function get_recording_key()
				local recording_register = vim.fn.reg_recording()
				return recording_register ~= "" and ("Recording:@" .. recording_register) or ""
			end
			local function totalines()
				return vim.fn.line("$")
			end

			require("lualine").setup({
				options = {
					theme = "tokyonight", -- Replace 'tokyonight' with your desired lualine theme
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
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { -- Bottom section
						get_recording_key, -- Include the custom function directly
						-- totalines,
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
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
			},
		},
		keys = {
			{
				"<leader>nl",
				function()
					require("noice").cmd("last")
				end,
				desc = "Last",
			},
			{
				"<leader>nh",
				function()
					require("noice").cmd("history")
				end,
				desc = "History",
			},
			{
				"<leader>nd",
				function()
					require("noice").cmd("dismiss")
				end,
				desc = "Dismiss all",
			},
		},
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		opts = function()
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.val = {
				"    ⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄ ",
				"    ⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄ ",
				"   ⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄ ",
				"   ⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄ ",
				"  ⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰ ",
				"  ⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤ ",
				" ⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗ ",
				" ⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟  ",
				" ⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃  ",
				" ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃  ",
				"  ⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃   ",
				"   ⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁    ",
				"     ⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁      ",
				"        ⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁     ⢀⣠⣴ ",
				" ⣿⣿⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⣠⣴⣿⣿⣿ ",
				"",
				"           N E O V I M ",
			}

			dashboard.section.buttons.val = {
				dashboard.button("n", "  New file", "<cmd>ene<CR>"),
				dashboard.button(
					"SPC q l",
					"  Restore last session",
					[[<cmd>lua require("persistence").load({ last = true })<CR>]]
				),
				dashboard.button("SPC f r", "  Recent files", "<cmd>Telescope oldfiles<CR>"),
				dashboard.button("SPC f f", "  Find file", "<cmd>Telescope find_files<CR>"),
				dashboard.button("SPC f p", "  Projects", "<cmd>Telescope projects<CR>"),
				dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<CR>"),
				dashboard.button("m", "󱌣  Mason", "<cmd>Mason<CR>"),
				dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
			}

			return dashboard
		end,
		config = function(_, dashboard)
			local alpha = require("alpha")

			vim.api.nvim_create_autocmd("User", {
				callback = function()
					local stats = require("lazy").stats()
					local ms = math.floor(stats.startuptime * 100) / 100
					dashboard.section.footer.val = "󱐌 Lazy-loaded "
						.. stats.loaded
						.. "/"
						.. stats.count
						.. " plugins in "
						.. ms
						.. "ms"
					pcall(vim.cmd.AlphaRedraw)
				end,
			})

			alpha.setup(dashboard.opts)
		end,
	},
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.scroll = {
				enable = true,
			}
		end,
	},
}
