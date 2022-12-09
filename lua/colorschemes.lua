local base16 = function(use)
  vim.g.base16colorspace = 256
  use({ 'chriskempson/base16-vim' })
end

local gruvboxBaby = function(use)
  use({
    'luisiacc/gruvbox-baby',
    config = function()
      vim.cmd('colorscheme gruvbox-baby')
    end,
  })
end

return function(use)
  -- Enables 24-bit RGB color in the TUI.
  vim.opt.termguicolors = true

  base16(use)
  gruvboxBaby(use)
end
