local bufferSearch = function(use)
  -- Ignore case in searches.
  vim.opt.ignorecase = true
  -- Don't ignore case with capitals.
  vim.opt.smartcase = true

  -- Highlight searches as you type.
  vim.opt.hlsearch = true
  -- Show matches while typing.
  vim.opt.incsearch = true
end

local findModalDialog = function(use)
  -- Find Files (and other things)
  -- TODO: configure with https://github.com/nvim-telescope/telescope.nvim when
  -- WhichKey has been installed/configured.
  use({
    'nvim-telescope/telescope.nvim',
    after = { 'which-key.nvim' },
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require('telescope')
      local telescopeBuiltin = require('telescope.builtin')
      local whichkey = require('which-key')

      telescope.setup({
        defaults = {
          -- Default configuration for telescope goes here:
          -- config_key = value,
          mappings = {
            -- i = {
            --   -- map actions.which_key to <C-h> (default: <C-/>)
            --   -- actions.which_key shows the mappings for your picker,
            --   -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            --   ["<C-h>"] = "which_key"
            -- }
          },
        },
        pickers = {
          -- Default configuration for builtin pickers goes here:
          -- picker_name = {
          --   picker_config_key = value,
          --   ...
          -- }
          -- Now the picker_config_key will be applied every time you call this
          -- builtin picker
        },
        extensions = {
          -- Your extension configuration goes here:
          -- extension_name = {
          --   extension_config_key = value,
          -- }
          -- please take a look at the readme of the extension you want to configure
        },
      })

      local findFiles = function()
        telescopeBuiltin.find_files({ hidden = true })
      end

      whichkey.register({
        f = {
          name = 'Find',
          C = { telescopeBuiltin.command_history, 'command history' },
          ['/'] = { telescopeBuiltin.current_buffer_fuzzy_find, 'in buffer' },
          b = { telescopeBuiltin.buffers, 'buffers' },
          c = { telescopeBuiltin.commands, 'commands' },
          g = {
            name = 'Git',
            b = { telescopeBuiltin.git_branches, 'branches' },
            c = { telescopeBuiltin.git_commits, 'commits' },
            d = { telescopeBuiltin.git_bcommits, 'diff' },
            s = { telescopeBuiltin.git_status, 'status' },
            t = { telescopeBuiltin.git_stash, 'stash' },
          },
          f = { telescopeBuiltin.live_grep, 'in files' },
          h = { telescopeBuiltin.help_tags, 'help tags' },
          p = { findFiles, 'files' },
          q = { telescopeBuiltin.quickfix, 'quickfix' },
          r = { telescopeBuiltin.registers, 'registers' },
          l = {
            name = 'LSP',
            a = { telescopeBuiltin.lsp_code_actions, 'code actions' },
            d = { telescopeBuiltin.lsp_definitions, 'definitions' },
            t = { telescopeBuiltin.lsp_type_definitions, 'type definitions' },
            i = { telescopeBuiltin.lsp_implementations, 'implementations' },
            r = { telescopeBuiltin.lsp_references, 'references' },
            s = { telescopeBuiltin.lsp_document_symbols, 'document symbols' },
            w = { telescopeBuiltin.lsp_workspace_symbols, 'workspace symbols' },
          },
        },
      }, { prefix = '<leader>' })
    end,
  })
end

return function(use)
  bufferSearch(use)
  findModalDialog(use)
end
