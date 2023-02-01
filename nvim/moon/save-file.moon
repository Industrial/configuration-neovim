indentationGuides = (use) ->
  use {
    "lukas-reineke/indent-blankline.nvim"
    config: () ->
      indentBlankline = require "indent_blankline"
      indentBlankline.setup {
        show_current_context: true
        show_current_context_start: true
      }
  }

(use) ->
  vim.keymap.set "n", "<C-s>", ":write<cr>", {}
  vim.keymap.set "i", "<C-s>", "<esc>:write<cr>a", {}

  indentationGuides use
