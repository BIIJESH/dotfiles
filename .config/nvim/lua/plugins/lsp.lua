return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		opts = {
			servers = {
				pyright = {},
				zls = {},
				ts_ls = {
					single_file_support = false,
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "literal",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = false,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
					completion = {
						callSnippet = "Replace",
						completeFunctionCalls = true,
					},
				},
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
			},
		},
		config = function(_, opts)
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(opts.servers),
			})
			local on_attach = function(_, _)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
				vim.keymap.set("n", "<leader>ca", require("fzf-lua").lsp_code_actions, { desc = "Code Actions" })
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Definition" })
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation" })
				vim.keymap.set("n", "gr", require("fzf-lua").lsp_references, { desc = "References" })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
			end
			mason_lspconfig.setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = on_attach,
						capabilities = capabilities,
						settings = opts.servers[server_name] and opts.servers[server_name].settings or nil,
					})
				end,
			})

			-- Setup Emmet LSP
			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
				filetypes = {
					"css",
					"eruby",
					"html",
					"less",
					"javascriptreact",
					"sass",
					"scss",
					"svelte",
					"pug",
					"typescriptreact",
					"vue",
				},
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			"saghen/blink.cmp",
		},
		opts = function()
			local null_ls = require("null-ls")
			return {
				sources = {
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.stylua,
				},
			}
		end,
		keys = {
			{ "<leader>cf", vim.lsp.buf.format, desc = "Format" },
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		opts = {
			ensure_installed = { "black", "prettier", "stylua", "shfmt" },
		},
	},
	{
		"saghen/blink.cmp",
		version = "*",
		event = "LspAttach",
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = {
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			keymap = {
				preset = "enter",
				["<Enter>"] = { "accept", "fallback" },
				["<Tab>"] = { "select_next" },
				["<S-Tab>"] = { "select_prev" },
			},
			completion = {
				menu = { border = "single" },
				documentation = {
					auto_show_delay_ms = 0,
					window = {
						border = "single",
					},
					auto_show = true,
				},
				trigger = {
					show_in_snippet = true,
					show_on_trigger_character = true,
				},
			},
			signature = {
				window = {
					border = "single",
				},
			},
			sources = {
				default = { "path", "snippets", "buffer" }, --removing lsp from here the snippets were faster
				cmdline = { enabled = false },
			},
		},
	},
	{
		"olrtg/nvim-emmet",
		event = "InsertEnter",
		config = function()
			vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
		end,
	},
}
