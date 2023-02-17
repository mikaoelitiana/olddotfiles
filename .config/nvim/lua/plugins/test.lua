return {
  "vim-test/vim-test",
  dependencies = { "tpope/vim-dispatch" },
  keys = {
    {
      "<leader>kn",
      "<cmd>TestNearest<cr>",
      desc = "Run the nearest test",
    },
    {
      "<leader>kl",
      "<cmd>TestLast<cr>",
      desc = "Debug the last test",
    },
    {
      "<leader>kf",
      "<cmd>TestFile<cr>",
      desc = "Run current file",
    },
    {
      "<leader>ks",
      "<cmd>TestSuite<cr>",
      desc = "Debug the nearest test",
    },
    {
      "<leader>kg",
      "<cmd>TestVisit<cr>",
      desc = "Open test output",
    },
  },
}
