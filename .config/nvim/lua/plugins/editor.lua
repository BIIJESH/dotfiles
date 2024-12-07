return {
	{
		"lewis6991/gitsigns.nvim", --TODO: need to check this
		opts = {},
		keys = {
			{
				"]h",
				function()
					require("gitsigns").nav_hunk("next")
				end,
				desc = "Next hunk",
			},
			{
				"[h",
				function()
					require("gitsigns").nav_hunk("prev")
				end,
				desc = "Previous hunk",
			},
			{ "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
			{ "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle current line blame" },
			{ "<leader>gtd", "<cmd>Gitsigns toggle_deleted<CR>", desc = "Toggle deleted" },
		},
	},
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			delay = 200,
			filetypes_denylist = {
				"alpha",
				"help",
				"lazy",
				"mason",
				"neo-tree",
				"Outline",
				"spectre_panel",
				"TelescopePrompt",
				"Trouble",
				"undotree",
			},
		},
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
	},
	{
		"nvim-pack/nvim-spectre",
		cmd = "Spectre",
		opts = {},
		keys = {
			{
				"<leader>ts",
				function()
					require("spectre").toggle()
				end,
				desc = "Spectre",
			},
		},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "Trouble", "TroubleToggle" },
		opts = {},
		keys = {
			{ "<leader>xx", "<cmd>Trouble diagnostics<CR>", desc = "Diagnostics (Trouble)" },
			{
				"<leader>xw",
				"<cmd>Trouble diagnostics toggle filter.buf =0<CR>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Location list (Trouble)" },
			{ "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix list (Trouble)" },
		},
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "TodoTrouble", "TodoTelescope" },
		opts = {},
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next todo comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous todo comment",
			},
			{ "<leader>ft", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<CR>", desc = "Todo/Fix/Fixme (Trouble)" },
			{ "<leader>xT", "<cmd>TodoTrouble toggle<CR>", desc = "Todo (Trouble)" },
			{ "<leader>xt", "<cmd>TodoTelescope<CR>", desc = "Todo" },
			{ "<leader>fT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<CR>", desc = "Todo/Fix/Fixme" },
		},
	},
	{
		"folke/flash.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
				{
					"<c-s>",
					mode = { "c" },
					function()
						require("flash").toggle()
					end,
					desc = "Toggle Flash Search",
				},
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		dependencies = {
			"echasnovski/mini.icons",
		},
		opts_extend = { "spec" },
		opts = {
			defaults = {},
			spec = {
				{
					mode = { "n", "v" },
					{ "<leader>b", group = "buffer" },
					{ "<leader>c", group = "code" },
					{ "<leader>f", group = "find" },
					{ "<leader>g", group = "git" },
					{ "<leader>gt", group = "toggle" },
					{ "<leader>n", group = "noice" },
					{ "<leader>q", group = "session" },
					{ "<leader>t", group = "toggle" },
					{ "<leader>x", group = "diagnostics/quickfix" },
					{ "]", group = "next" },
					{ "[", group = "previous" },
					{ "g", group = "goto" },
					{ "z", group = "fold" },
				},
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
		end,
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer local keymaps (which-key)",
			},
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "InsertEnter",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"folke/tokyonight.nvim",
		opts = {
			style = "night",
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd("colorscheme tokyonight")
		end,
	},
}
