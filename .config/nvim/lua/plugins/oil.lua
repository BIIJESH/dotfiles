return {
  {
    "stevearc/oil.nvim",
    lazy = true,
    event = "VimEnter",
    config = function()
      local oil = require("oil")
      oil.setup({
        columns = { "icon" },
        keymaps = {
          ["C-h"] = false,
          ["M-h"] = "actions.select_split",
        },
        view_options = {
          show_hidden = true,
        },
      })
      -- Define the toggle float keymap within the config
      vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent dir" })
      vim.keymap.set("n", "<leader>of", require("oil").toggle_float, { desc = "Toggle Oil Float" })
    end,
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
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
    },
    cmd = "Telescope",
    opts = {},
    config = function(_, opts)
      require("telescope").setup({
        event = "VeryLazy",
        defaults = {
          file_ignore_patterns = { "%.class", "%.png", "%.jpg", "node_modules/.*", "venv/.*" },
          selection_caret = "󱞩 ",
          prompt_prefix = "   ",
          layout_strategy = "horizontal",
          layout_config = {
            preview_width = 0.65,
            horizontal = {
              size = {
                width = "95%",
                height = "95%",
              },
            },
          },
          border = false,
        },
      })
      require("telescope").load_extension("fzf")
    end,
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>",  desc = "Files" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>",    desc = "Recent files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>",   desc = "Text" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>",     desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>",   desc = "Help tags" },
      { "<leader>fc", "<cmd>Telescope commands<CR>",    desc = "Commands" },
      { "<leader>fC", "<cmd>Telescope colorscheme<CR>", desc = "Colorscheme" },
      { "<leader>fp", "<cmd>Telescope projects<CR>",    desc = "Projects" },
    },
  },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   cmd = "Neotree",
  --   opts = {
  --     window = {
  --       width = 25,
  --     },
  --   },
  --   keys = {
  --     { "<leader>te", "<cmd>Neotree toggle reveal<CR>",  desc = "Neotree" },
  --     { "<leader>tb", "<cmd>Neotree toggle buffers<CR>", desc = "Buffers (Neotree)" },
  --   },
  -- },
}
