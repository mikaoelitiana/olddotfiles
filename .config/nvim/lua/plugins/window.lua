return {
  {
    "nvim-zh/colorful-winsep.nvim",
    opts = {
      no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "neo-tree" },
    },
    event = { "WinNew" },
  },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup()
    end,
  },
  {
    "https://gitlab.com/yorickpeterse/nvim-window.git",
    keys = {
      {
        "<leader>wp",
        function()
          require("nvim-window").pick()
        end,
        desc = "Pick a window",
      },
    },
  },
}
