(use) ->
  use {
    "akinsho/bufferline.nvim",
    requires: { "nvim-tree/nvim-web-devicons" },
    config: () ->
      bufferline = require "bufferline"

      bufferline.setup {
        options:
          mode: "buffers"
          diagnostics: "nvim_lsp"
          offsets:
            {
              filetype: "NvimTree"
              text: "File Explorer"
              highlight: "Directory"
              separator: true
            }
      }
  }
