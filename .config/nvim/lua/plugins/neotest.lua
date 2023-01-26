return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-plenary",
    "haydenmeade/neotest-jest",
    "vim-test/vim-test",
    "nvim-neotest/neotest-vim-test",
  },
  keys = {
    {
      "<leader>kn",
      function()
        require("neotest").run.run()
      end,
      desc = "Run the nearest test",
    },
    {
      "<leader>kl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run the last test",
    },
    {
      "<leader>kl",
      function()
        require("neotest").run.run_last({ strategy = "dap" })
      end,
      desc = "Debug the last test",
    },
    {
      "<leader>kf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run current file",
    },
    {
      "<leader>kd",
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Debug the nearest test",
    },
    {
      "<leader>ko",
      function()
        require("neotest").output.open({ enter = true })
      end,
      desc = "Open test output",
    },
  },
}
