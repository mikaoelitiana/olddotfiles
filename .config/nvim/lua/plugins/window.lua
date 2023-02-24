return {
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
