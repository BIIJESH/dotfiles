return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      { "folke/neodev.nvim", opts = {} },
    },
    opts = {
      servers = {
        pyright = {},
        rust_analyzer = {},
        tsserver = {
          completion = {
            callSnippet = "Replace",
          },
        },
        lua_ls = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
    },
    config = function(_, opts)
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(opts.servers),
      })

      local on_attach = function(_, _)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Actions" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Definition" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation" })
        vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "References" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
      end

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = opts.servers[server_name],
          })
        end,
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
      ensure_installed = { "black", "prettier", "stylua" },
    },
  },
}
