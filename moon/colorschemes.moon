base16 = (use) ->
  vim.g.base16colorspace = 256
  use "chriskempson/base16-vim"

gruvboxBaby = (use) ->
  use {
    "luisiacc/gruvbox-baby"
    config: () ->
      vim.cmd "colorscheme gruvbox-baby"
  }

(use) ->
  -- Enables 24-bit RGB color in the TUI.
  vim.opt.termguicolors = true

  base16 use
  gruvboxBaby use
