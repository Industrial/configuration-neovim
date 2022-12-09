local M = {}

M.VersionControl = function()
  -- Version Control
  vim.Plug('tpope/vim-fugitive')
  vim.Plug('junegunn/gv.vim')
  vim.Plug('mhinz/vim-signify')

  vim.Plug('mattn/webapi-vim')
  vim.Plug('mattn/gist-vim')
  -- If you want to detect filetype from the filename:
  vim.g.gist_detect_filetype = 1
  -- If you want your gist to be private by default:
  vim.g.gist_post_private = 1
  -- If you want to manipulate multiple files in a gist:
  vim.g.gist_get_multiplefile = 1

  -- Doesn't work with base16
  -- vim.Plug('vim-scripts/vim-signify')
end
