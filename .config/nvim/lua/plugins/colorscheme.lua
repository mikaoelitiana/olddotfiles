return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = function(config)
      config.style = "moon"
      config.dim_inactive = true
      return config
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {},
  },
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      require("statuscol").setup({})
    end,
  },
}
