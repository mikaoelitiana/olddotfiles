return {
  -- "vim-test/vim-test",
  "https://github.com/mikaoelitiana/vim-test",
  brahc = "optional-ts-node",
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
      desc = "Run test suite",
    },
    {
      "<leader>kg",
      "<cmd>TestVisit<cr>",
      desc = "Open test output",
    },
  },
}
