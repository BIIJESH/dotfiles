return {
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { 'saghen/blink.cmp' },
    opts = {
      servers = {
        lua_ls = {},
        ts_ls = {
          completion = {
            callSnippet = "Replace",
            completeFunctionCalls = true,
          },
        }
      }
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      for server, config in pairs(opts.servers) do
        config.capabilities = capabilities
        lspconfig[server].setup(config)
      end
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
    "saghen/blink.cmp",
    version = "*",
    dependencies = 'rafamadriz/friendly-snippets',
    event = "LspAttach",
    opts = {
      appearance = {
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
        default = { "path", "snippets", "buffer", "lsp" },--BUG:with lsp as source ts_ls is so slow 
        cmdline = { enabled = false },
      },
    },
  }
}
