-- Deal with the diagnostic results of language servers and linting tools.
local diagnostics = function(use)
  use({
    'folke/trouble.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local whichkey = require('which-key')
      local trouble = require('trouble')

      trouble.setup({
        auto_open = true,
        auto_close = true,
        auto_preview = true,
        -- auto_fold = true,
        use_diagnostic_signs = true,
      })

      whichkey.register({
        x = {
          name = 'Quickfix',
          x = { '<cmd>TroubleToggle<cr>', 'Toggle' },
          w = { '<cmd>TroubleToggle workspace_diagnostics<cr>', 'Workspace' },
          d = { '<cmd>TroubleToggle document_diagnostics<cr>', 'Document' },
          l = { '<cmd>TroubleToggle loclist<cr>', 'Loclist' },
          q = { '<cmd>TroubleToggle quickfix<cr>', 'Quickfix' },
          R = { '<cmd>TroubleToggle lsp_references<cr>', 'References' },
        },
      }, { prefix = '<leader>' })
    end,
  })
end

local highlightCursorLine = function(use)
  -- Highlight the line the cursor is on.
  vim.opt.cursorline = true
  -- Don't highlight the column the cursor is on.
  vim.opt.cursorcolumn = false

  -- Display a column with signs when necessary.
  -- vim.opt.signcolumn = 'auto'
  vim.opt.signcolumn = 'auto'
end

return function(use)
  diagnostics(use)
  highlightCursorLine(use)
end
