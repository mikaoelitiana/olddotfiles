local wk = require("which-key")

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

wk.register({
  ["<leader>"] = {
    t = {
      name = "+test",
    },
  },
})

return {
  { "nvim-lua/plenary.nvim" },
  { "antoinemadec/FixCursorHold.nvim" },
  { "adrigzr/neotest-mocha", commit = "765a4e976927174518bfe311a169780e4d3bf234" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- should fix https://github.com/nvim-neotest/neotest-jest/issues/85
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
    },
    opts = function(_, opts)
      local mocha_util = require("neotest-mocha.util")
      local is_mocha_test_file = mocha_util.create_test_file_extensions_matcher(
        { "-test" },
        { "js", "mjs", "cjs", "jsx", "coffee", "ts", "tsx" }
      )

      opts.adapters = {
        ["neotest-jest"] = {
          jestCommand = Neotest_jest_command ~= nil and Neotest_jest_command or "npm test --",
          env = Neotest_jest_env ~= nil and Neotest_jest_env or { CI = true },
        },
        ["neotest-mocha"] = {
          command = get_var("neotest_mocha_command", "npm test --"),
          env = neotest_mocha_env ~= nil and neotest_mocha_env or { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
          is_test_file = neotest_mocha_is_test_file ~= nil and neotest_mocha_is_test_file or is_mocha_test_file,
        },
        ["neotest-vitest"] = {},
      }

      opts.status = {
        enabled = true,
        signs = true,
        virtual_text = false,
      }

      opts.consumers = {
        overseer = require("neotest.consumers.overseer"),
      }
    end,
    keys = {
      --   {
      --     "<leader>tf",
      --     function()
      --       require("neotest").run.run(vim.fn.expand("%"))
      --     end,
      --     desc = "Run current test file",
      --   },
      --   {
      --     "<leader>tn",
      --     function()
      --       require("neotest").run.run()
      --     end,
      --     desc = "Run nearest test",
      --   },
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run last test",
      },
      --   {
      --     "<leader>td",
      --     function()
      --       require("neotest").run.run({ strategy = "dap" })
      --     end,
      --     desc = "Debug nearest test",
      --   },
      --   {
      --     "<leader>ts",
      --     function()
      --       require("neotest").summary.toggle()
      --     end,
      --     desc = "Toggle summary view",
      --   },
      --   {
      --     "<leader>to",
      --     function()
      --       require("neotest").output.open({ enter = true })
      --     end,
      --     desc = "View output",
      --   },
    },
  },
}
