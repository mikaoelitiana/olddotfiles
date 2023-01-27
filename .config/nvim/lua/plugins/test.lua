return {
  "vim-test/vim-test",
  dependencies = {},
  keys = {
    {
      "<leader>kn",
      "<cmd>TestNearest<cr>",
      desc = "Run the nearest test",
    },
    {
      "<leader>kl",
      "<cmd>TestLast<cr>",
      desc = "Run the last test",
    },
    {
      "<leader>kf",
      "<cmd>TestFile<cr>",
      desc = "Run current file",
    },
    {
      "<leader>ks",
      "<cmd>TestSuite<cr>",
      desc = "Run suite",
    },
    {
      "<leader>ks",
      "<cmd>TestVisit<cr>",
      desc = "Visit last test",
    },
  },
}
