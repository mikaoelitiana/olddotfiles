local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    k = {
      name = "+test",
    },
    t = {
      name = "+test",
    },
  },
})

return {
  {
    -- "vim-test/vim-test",
    "https://github.com/mikaoelitiana/vim-test",
    branch = "optional-ts-node",
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
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
    opts = function()
      return {
        adapters = {
          require("neotest-jest")({
            jestCommand = function()
              local function get_var(my_var_name, default_value)
                s, v = pcall(function()
                  return vim.api.nvim_get_var(my_var_name)
                end)
                if s then
                  return v
                else
                  return default_value
                end
              end

              return get_var("neotest_jest_command", "npm test --")
            end,
          }),
        },
        consumers = {
          overseer = require("neotest.consumers.overseer"),
        },
      }
    end,
    keys = {
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run current test file",
      },
      {
        "<leader>tn",
        function()
          require("neotest").run.run()
        end,
        desc = "Run nearest test",
      },
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run last test",
      },
      {
        "<leader>td",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Debug nearest test",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle summary view",
      },
      {
        "<leader>to",
        function()
          require("neotest").output.open({ enter = true })
        end,
        desc = "View output",
      },
    },
  },
}
