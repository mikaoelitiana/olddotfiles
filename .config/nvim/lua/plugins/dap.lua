return {
  {
    "mxsdev/nvim-dap-vscode-js",
    event = "VeryLazy",
    config = function()
      local dap = require("dap")
      -- local mason_registry = require("mason-registry")
      -- local js_debug_pkg = mason_registry.get_package("node-debug2-adapter")
      -- local js_debug_path = js_debug_pkg:get_install_path()

      -- dap.adapters.node2 = {
      --   type = "executable",
      --   command = "node",
      --   args = { js_debug_path },
      -- }

      for _, language in ipairs({ "javascript", "typescript" }) do
        dap.configurations[language] = {
          {
            type = "node2",
            request = "launch",
            name = "Launch file (" .. language .. ")",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "node2",
            request = "attach",
            name = "Attach to process (" .. language .. ")",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            protocol = "inspector",
            console = "integratedTerminal",
            outputCapture = "std",
          },
        }
      end

      -- read .vscode/launch.json
      require("dap.ext.vscode").load_launchjs(
        nil,
        { node2 = { "javascript", "javascriptreact", "typescriptreact", "typescript" } }
      )
    end,
  },
}
