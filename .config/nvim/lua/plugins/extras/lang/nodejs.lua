return {

  -- add js to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "css", "html", "javascript", "jsdoc", "scss" })
    end,
  },

  -- correctly setup mason lsp / dap extensions
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "eslint-lsp", "html-lsp", "js-debug-adapter" })
    end,
  },

  {
    "mxsdev/nvim-dap-vscode-js",
    event = "VeryLazy",
    config = function()
      local dap = require("dap")
      local dap_js = require("dap-vscode-js")
      local mason_registry = require("mason-registry")
      local js_debug_pkg = mason_registry.get_package("js-debug-adapter")
      local js_debug_path = js_debug_pkg:get_install_path()
      dap_js.setup({
        debugger_path = js_debug_path,
        adapters = { "pwa-node", "node-terminal" }, -- which adapters to register in nvim-dap
      })
      for _, language in ipairs({ "javascript" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file (" .. language .. ")",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach to process",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            protocol = "inspector",
            console = "integratedTerminal",
            outputCapture = "std",
          },
        }
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { eslint = {} },
      setup = {
        eslint = function()
          require("lazyvim.util").on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
}
