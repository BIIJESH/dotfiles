return {
  {
    "saghen/blink.cmp",
    version = "v0.*",
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
        enabled = true,
        window = {
          border = "single",
        },
      },
      sources = {
        providers = {
          lsp = {
            async = true
          },
        },
        default = { "lsp", "path", "snippets", "buffer" }, --BUG:with lsp as source ts_ls is so slow
        cmdline = { enabled = false },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "AstroNvim/astrolsp", opts = {} },
    name = "lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
    vim.tbl_map(require("astrolsp").lsp_setup, require("astrolsp").config.servers)
      require "plugins.lsp"
    end,
  },
}
