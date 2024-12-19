return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre" },
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		opts = {
			servers = {
				pyright = {},
				ts_ls = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
					single_file_support = false,
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "literal",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = false,
								includeInlayPropertyDeclarationTypeHints = true,
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
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(opts.servers),
			})
			lspconfig.html.setup({
				filetypes = { "html", "ejs" },
			})
			local on_attach = function(_, _)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Actions" })
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Definition" })
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation" })
				vim.keymap.set("n", "gr", require("fzf-lua").lsp_references, { desc = "References" })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
			end

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
				-- on_attach = on_attach,
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
				init_options = {
					html = {
						options = {
							["bem.enabled"] = true,
						},
					},
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
}
