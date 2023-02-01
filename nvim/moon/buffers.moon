(use) ->
  whichkey = require "which-key"

  -- load filetype plugins, indentation and turn syntax highlighting on
  vim.cmd "filetype plugin indent on"

  -- Buffers in the background.
  vim.opt.hidden = true

  -- don"t wrap lines
  vim.opt.wrap = false

  vim.keymap.set "n", "<Tab>", ":BufferLineCycleNext<cr>", {}
  vim.keymap.set "n", "<S-Tab>", ":BufferLineCyclePrev<cr>", {}

  whichkey.register {
    b:
      name: "Buffers",
      b: { "<cmd>Telescope buffers<cr>", "Buffers" },
      d: { "<cmd>bd<cr>", "Delete" },
      n: { "<cmd>BufferLineCycleNext<cr>", "Next" },
      p: { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
  }, {
    prefix: "<leader>"
  }
