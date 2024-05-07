return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)

      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {},
  },
  {
    "gbprod/nord.nvim",
    opts = {},
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {},
  },
}
