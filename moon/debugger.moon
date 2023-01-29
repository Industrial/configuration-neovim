lua = (use) ->
  use {
    "jbyuki/one-small-step-for-vimkind",
    config: () ->
      dap = require "dap"

      dap.configurations.lua = {
        {
          type: "nlua"
          request: "attach"
          name: "Attach to running Neovim instance"
        }
      }

      dap.adapters.nlua = (callback, config) ->
        callback {
          type: "server"
          host: config.host or "127.0.0.1"
          port: config.port or 8086
        }
  }

python = (use) ->
  use {
    "mfussenegger/nvim-dap-python"
    requires: { "nvim-telescope/telescope-dap.nvim" }
    config: () ->
      dapPython = require "dap-python"
      dapPython.setup "~/.virtualenvs/debugpy/bin/python"
  }

nodejs = (use) ->
  use {
    "mxsdev/nvim-dap-vscode-js"
    requires: { "mfussenegger/nvim-dap" }
    setup: () ->
      dap = require "dap"
      dapVscodeJs = require "dap-vscode-js"

      dapVscodeJs.setup {
        adapters: {
          "pwa-node"
          "pwa-chrome"
          "pwa-msedge"
          "node-terminal"
          "pwa-extensionHost"
        }
      }

      for _, language in ipairs { "typescript", "javascript" } do
        dap.configurations[language] = {
          {
            type: "pwa-node"
            request: "launch"
            name: "Launch file"
            program: "${file}"
            cwd: "${workspaceFolder}"
          },
          {
            type: "pwa-node"
            request: "attach"
            name: "Attach"
            processId: require"dap.utils".pick_process
            cwd: "${workspaceFolder}"
          },
          {
            type: "pwa-node"
            request: "launch"
            name: "Debug Jest Tests"
            -- trace: true, -- include debugger info
            runtimeExecutable: "node"
            runtimeArgs: {
              "./node_modules/jest/bin/jest.js"
              "--runInBand"
            },
            rootPath: "${workspaceFolder}"
            cwd: "${workspaceFolder}"
            console: "integratedTerminal"
            internalConsoleOptions: "neverOpen"
          }
        }
  }

  -- TODO: Do this for all the LSP dependencies.
  use {
    "microsoft/vscode-js-debug"
    opt: true
    run: "npm install --legacy-peer-deps && npm run compile"
  }

interface = (use) ->
  use {
    "rcarriga/nvim-dap-ui"
    require: { "mfussenegger/nvim-dap" }
    config: () ->
      dapui = require "dapui"

      dapui.setup!
  }

(use) ->
  use {
    "mfussenegger/nvim-dap"
    config: () ->
      whichkey = require "which-key"
      dapui = require "dapui"

      whichkey.register {
        d:
          name: "Debug"
          d: { dapui.toggle, "Toggle DAP UI" }
          c: { "<cmd>DapContinue<cr>", "Continue" }
          s: { "<cmd>DapTerminate<cr>", "Stop" }
          b: { "<cmd>DapToggleBreakpoint<cr>", "Breakpoint" }
          r: { "<cmd>DapRestartFrame<cr>", "Breakpoint" }
          j: { "<cmd>DapStepOver<cr>", "Step Over" }
          J: { "<cmd>DapStepInto<cr>", "Step Into" }
          K: { "<cmd>DapStepOut<cr>", "Step Out" }
      }, {
        prefix: "<leader>"
      }
  }

  interface use
  lua use
  --nodejs use
  python use
