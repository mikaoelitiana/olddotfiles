return {
  {
    "nvim-zh/colorful-winsep.nvim",
    opts = {
      no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "neo-tree" },
    },
    event = { "WinNew" },
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
