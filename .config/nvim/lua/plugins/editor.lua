return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
		keys = {
			{
				"]h",
				function()
					require("gitsigns").next_hunk()
				end,
				desc = "Next hunk",
			},
			{
				"[h",
				function()
					require("gitsigns").prev_hunk()
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
				"noice",
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
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		keys = {
			{ "<leader>tu", "<cmd>UndotreeToggle<CR>", desc = "Undo tree" },
		},
	},
	{
		"hedyhli/outline.nvim",
		cmd = "Outline",
		opts = {},
		keys = {
			{ "<leader>to", "<cmd>Outline<CR>", desc = "Outline" },
		},
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
			{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Document diagnostics" },
			{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace diagnostics" },
			{ "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Location list" },
			{ "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Quickfix list" },
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
			{ "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Todo (Trouble)" },
			{ "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<CR>", desc = "Todo/Fix/Fixme (Trouble)" },
			{ "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Todo" },
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
		opts = {
			defaults = {
				mode = { "n", "v" },
				["]"] = { name = "+next" },
				["["] = { name = "+previous" },
				["g"] = { name = "+goto" },
				["<leader>b"] = { name = "+buffer" },
				["<leader>c"] = { name = "+code" },
				["<leader>f"] = { name = "+find" },
				["<leader>g"] = { name = "+git" },
				["<leader>gt"] = { name = "+toggle" },
				["<leader>n"] = { name = "+noice" },
				["<leader>q"] = { name = "+session" },
				["<leader>t"] = { name = "+toggle" },
				["<leader>x"] = { name = "+diagnostics/quickfix" },
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register(opts.defaults)
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

}
