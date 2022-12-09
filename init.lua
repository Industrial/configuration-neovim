-- Disable NetRW
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Install plugin manager
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer...')
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  vim.fn.system({ 'git', 'clone', '--depth', '1', packer_url, install_path })
  print('Done.')
  vim.cmd('packadd packer.nvim')
  install_plugins = true
end

require('packer').startup(function(use)
  -- Package manager
  use({ 'wbthomason/packer.nvim' })

  -- WhichKey is used by many parts of the config, so load it first.
  use({
    'folke/which-key.nvim',
    config = function()
      local whichkey = require('which-key')

      whichkey.setup({
        -- plugins = {
        --   marks = false,
        --   registers = false,
        --   spelling = { enabled = false, suggestions = 20 },
        --   presets = {
        --     operators = false,
        --     motions = false,
        --     text_objects = false,
        --     windows = false,
        --     nav = false,
        --     z = false,
        --     g = false,
        --   },
        --   window = { border = 'single', position = 'top', margin = { 1, 0, 1, 0 }, padding = { 2, 2, 2, 2 } },
        --   layout = { height = { min = 4, max = 25 }, width = { min = 20, max = 50 }, spacing = 3, align = 'center' },
        -- },
      })
    end,
  })

  require('backups')(use)
  require('buffers-and-splits')(use)
  require('colorschemes')(use)
  require('completion')(use)
  require('indentation')(use)
  require('movement')(use)
  require('search')(use)
  require('visual-information')(use)

  if install_plugins then
    require('packer').sync()
  end
end)

if install_plugins then
  return
end

-- Set the map leader to space
vim.g.mapleader = ' '

-- open and reload init.vim
-- vim.keymap.set('n', '<leader>i', ':edit ~/.config/nvim/init.vim<cr>', {})
-- vim.keymap.set('n', '<leader>I', ':bufdo :source ~/.config/nvim/init.vim<cr>:bufdo :filetype detect<cr>', {})
