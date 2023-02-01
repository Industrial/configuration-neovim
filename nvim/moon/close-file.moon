(use) ->
  -- Keep splits open when closing a buffer.
  use "Industrial/vim-smartbd"

  vim.keymap.set "n", "<C-q>", ":SmartBd<cr>",
    noremap: true
