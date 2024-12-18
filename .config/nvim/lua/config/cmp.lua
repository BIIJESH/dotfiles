local cmp = require("cmp")
local luasnip = require("luasnip")

vim.filetype.add({ extension = { ejs = "ejs" } })
luasnip.filetype_set("ejs", { "html", "javascript", "ejs" })

cmp.setup({
	window = {
		completion = {
			completeopt = "menu,menuone,noinsert",
			border = "rounded",
		},
		documentation = {
			border = "rounded",
		},
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "nvim_lsp_signature_help" },
	},
})
