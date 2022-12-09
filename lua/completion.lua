local astparser = function(use)
  -- TreeSitter, AST Parser and keyword colorizer.
  use({
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'all',
        sync_install = false,
        auto_install = true,
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        autotag = { enable = true },
        rainbow = {
          enable = true,
          extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          -- termcolors = {} -- table of colour name strings
        },
        autopairs = { enable = true },
      })
    end,
  })
end

local completepairs = function(use)
  -- Complete brackets / pairs.
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end,
  })
end

local copilot = function(use)
  use({
    'github/copilot.vim',
    config = function()
      -- Maps are set a while after this config function runs so defer it.
      vim.defer_fn(function()
        vim.g.copilot_enabled = true
        vim.g.copilot_filetypes = { ['*'] = true }

        -- When I turn off mappings by using these options, automatic
        -- completion stops working, so turn the mappings off manually.
        -- Set the maps first to ensure that they exist before trying
        -- to unmap them when reloading the config.
        -- vim.g.copilot_no_maps = true
        -- vim.g.copilot_no_tab_map = true

        local isDisplayingSuggestion = function()
          local displayedSuggestion = vim.fn['copilot#GetDisplayedSuggestion']()
          return displayedSuggestion and string.len(displayedSuggestion.text) > 0
        end

        local next = function()
          if isDisplayingSuggestion() then
            vim.fn['copilot#Next']()
          else
            vim.fn['copilot#Suggest']()
          end
        end

        local previous = function()
          vim.fn['copilot#Previous']()
        end

        local dismiss = function()
          if isDisplayingSuggestion() then
            vim.fn['copilot#Dismiss']()
            return '<esc>'
          else
            return '<esc>'
          end
        end

        vim.keymap.set('i', '<C-]>', '')
        vim.keymap.del('i', '<C-]>')
        vim.keymap.set('i', '<M-]>', '')
        vim.keymap.del('i', '<M-]>')
        vim.keymap.set('i', '<M-[>', '')
        vim.keymap.del('i', '<M-[>')
        vim.keymap.set('i', '<M-\\>', '')
        vim.keymap.del('i', '<M-\\>')
        vim.keymap.set('i', '<C-j>', next, { script = true })
        vim.keymap.set('i', '<C-k>', previous, { script = true })
        -- vim.keymap.set("i", "<Tab>", "")
        -- vim.keymap.del("i", "<Tab>")
        -- vim.keymap.set("i", "<return>", accept, { script = true, expr = true, nowait = true })
        vim.keymap.set('i', '<esc>', dismiss, { script = true, expr = true })
      end, 100)
    end,
  })
end

local diagnosticsigns = function(use)
  -- Icons
  require('vim.lsp.protocol').CompletionItemKind = {
    '',
    '',
    'ƒ',
    ' ',
    '',
    '',
    '',
    'ﰮ',
    '',
    '',
    '',
    '',
    '了',
    ' ',
    '﬌ ',
    ' ',
    ' ',
    '',
    ' ',
    ' ',
    ' ',
    ' ',
    '',
    '',
    '<>',
  }

  -- Diagnostic Signs
  local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
  end
end

local languageServerProtocol = function(use)
  -- Language Server Protocol Completion.
  use({
    'onsails/lspkind.nvim',
    config = function()
      require('lspkind').init({})
    end,
  })

  use({
    'hrsh7th/nvim-cmp',
    after = { 'lspkind.nvim' },
    config = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')

      cmp.setup({
        sorting = {
          priority_weight = 2,
          comparators = {
            -- Below is the default comparator list and order for nvim-cmp
            cmp.config.compare.offset,
            -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        formatting = { format = lspkind.cmp_format({ mode = 'symbol', max_width = 50, symbol = {} }) },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp', group_index = 2 },
          { name = 'path', group_index = 2 },
          { name = 'buffer', group_index = 2 },
        }),
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, { { name = 'buffer' } }),
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, { mapping = cmp.mapping.preset.cmdline(), sources = { { name = 'buffer' } } })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } }),
      })
    end,
  })

  use({ 'neovim/nvim-lspconfig', after = { 'nvim-cmp' } })

  use({
    'hrsh7th/cmp-nvim-lsp',
    after = { 'nvim-lspconfig' },
    config = function()
      -- pip install python-lsp-server pyright
      -- npm i -g @cucumber/language-server bash-language-serverdot-language-server
      -- dot-language-server graphql-language-service-cli stylelint-lsp
      -- typescript-language-server typescript eslint vim-language-server
      -- vscode-langservers-extracted yaml-language-server
      -- cssmodules-language-server @johnnymorganz/stylua-bin

      local whichkey = require('which-key')
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local flags = { debounce_text_changes = 150 }

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })

      -- Bash
      lspconfig.bashls.setup({ capabilities = capabilities, flags = flags })

      -- Cucumber
      lspconfig.cucumber_language_server.setup({ capabilities = capabilities, flags = flags })

      -- CSS
      lspconfig.cssls.setup({
        capabilities = capabilities,
        flags = flags,
        cmd = { 'css-languageserver', '--stdio' },
        filetypes = { 'css', 'scss', 'less' },
        init_options = {
          embeddedLanguages = { css = true, scss = true, less = true, javascript = true, typescript = true },
        },
      })

      -- CSS Modules
      lspconfig.cssmodules_ls.setup({ capabilities = capabilities, flags = flags })

      -- Docker
      lspconfig.dockerls.setup({ capabilities = capabilities, cmd = { 'docker-langserver', '--stdio' }, flags = flags })

      -- Dot
      lspconfig.dotls.setup({ capabilities = capabilities, cmd = { 'dot-language-server', '--stdio' }, flags = flags })

      -- ESLint
      lspconfig.eslint.setup({
        capabilities = capabilities,
        flags = flags,
        cmd = {
          'node',
          vim.fn.stdpath('data') .. '/lspinstall/eslint/node_modules/.bin/eslint-language-server',
          '--stdio',
        },
      })

      -- GraphQL
      lspconfig.graphql.setup({
        capabilities = capabilities,
        flags = flags,
        cmd = { 'graphql-lsp', 'server', '-m', 'stream' },
      })

      -- HTML
      lspconfig.html.setup({
        capabilities = capabilities,
        flags = flags,
        cmd = { 'vscode-html-language-server', '--stdio' },
      })

      -- JSON
      lspconfig.jsonls.setup({
        capabilities = capabilities,
        flags = flags,
        commands = {
          Format = {
            function()
              vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line('$'), 0 })
            end,
          },
        },
      })

      -- Lua
      lspconfig.sumneko_lua.setup({
        capabilities = capabilities,
        flags = flags,
        cmd = { 'lua-language-server' },
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
            diagnostics = { globals = { 'vim' } },
            workspace = {
              library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true },
            },
          },
        },
      })

      -- StyleLint
      lspconfig.stylelint_lsp.setup({
        capabilities = capabilities,
        flags = flags,
        cmd = { 'stylelint-lsp', '--stdio' },
        filetypes = { 'css', 'scss', 'less' },
      })

      -- TypeScript
      lspconfig.tsserver.setup({
        capabilities = capabilities,
        flags = flags,
        on_attach = function(client)
          client.resolved_capabilities.document_formatting = false
          lspconfig.tsserver.setup({ capabilities = capabilities })
        end,
      })

      -- Vim
      lspconfig.vimls.setup({
        capabilities = capabilities,
        flags = flags,
        cmd = { 'vim-language-server', '--stdio' },
        filetypes = { 'vim' },
        init_options = {
          diagnostic = { enable = true },
          indexes = { count = 3, gap = 100, projectRootPatterns = { 'runtime', 'nvim', '.git', 'autoload', 'plugin' } },
          iskeyword = '@,48-57,_,192-255,-#',
          runtimepath = '',
          suggest = { fromRuntimepath = true, fromVimruntime = true },
          vimruntime = '',
        },
      })

      -- YAML
      lspconfig.yamlls.setup({
        capabilities = capabilities,
        flags = flags,
        cmd = { 'yaml-language-server', '--stdio' },
        filetypes = { 'yaml' },
        init_options = { validate = true, hover = true, completion = true, format = { enable = true } },
      })

      -- pylsp
      lspconfig.pylsp.setup({
        capabilities = capabilities,
        flags = flags,
        cmd = { 'pylsp' },
        filetypes = { 'python' },
        init_options = {
          plugins = {
            jedi_completion = { enabled = true },
            jedi_hover = { enabled = true },
            jedi_references = { enabled = true },
            jedi_signature_help = { enabled = true },
            jedi_symbols = { enabled = true },
            jedi_definition = { enabled = true },
            jedi_document_symbols = { enabled = true },
            jedi_implementations = { enabled = true },
            jedi_rename = { enabled = true },
            jedi_workspace_symbols = { enabled = true },
            pycodestyle = { enabled = true },
            pydocstyle = { enabled = true },
            pyflakes = { enabled = true },
            pylint = { enabled = true },
            mccabe = { enabled = true },
            preload = { enabled = true },
            rope_completion = { enabled = true },
            rope_hover = { enabled = true },
            rope_rename = { enabled = true },
            rope_references = { enabled = true },
            rope_signature_help = { enabled = true },
            rope_symbols = { enabled = true },
            rope_definition = { enabled = true },
            rope_document_symbols = { enabled = true },
            rope_implementations = { enabled = true },
            rope_workspace_symbols = { enabled = true },
          },
        },
      })

      -- pyright
      lspconfig.pyright.setup({
        capabilities = capabilities,
        flags = flags,
        cmd = { 'pyright-langserver', '--stdio' },
        filetypes = { 'python' },
        init_options = {
          analysis = {
            autoImportCompletions = true,
            autoSearchPaths = true,
            diagnosticMode = 'workspace',
            useLibraryCodeForTypes = true,
          },
        },
      })

      -- TODO: Implement using conmenu
      whichkey.register({
        l = {
          name = 'LSP',
          d = { vim.lsp.buf.definition, 'Definition' },
          D = { vim.lsp.buf.declaration, 'Declaration' },
          h = { vim.lsp.buf.hover, 'Hover' },
          i = { vim.lsp.buf.implementation, 'Implementation' },
          r = { vim.lsp.buf.references, 'References' },
          R = { vim.lsp.buf.rename, 'Rename' },
          a = { vim.lsp.buf.code_action, 'Code Action' },
          k = { vim.lsp.buf.signature_help, 'Signature Help' },
        },
      }, { prefix = '<leader>' })
    end,
  })

  use({ 'hrsh7th/cmp-buffer', after = { 'nvim-cmp' } })

  use({ 'hrsh7th/cmp-path', after = { 'nvim-cmp' } })

  use({ 'hrsh7th/cmp-cmdline', after = { 'nvim-cmp' } })

  use({
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'ThePrimeagen/refactoring.nvim', 'lewis6991/gitsigns.nvim' },
    config = function()
      local null_ls = require('null-ls')
      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

      null_ls.setup({
        sources = {
          null_ls.builtins.code_actions.eslint,
          null_ls.builtins.code_actions.gitrebase,
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.code_actions.refactoring,
          null_ls.builtins.code_actions.shellcheck,
          null_ls.builtins.completion.spell,
          null_ls.builtins.diagnostics.codespell,
          null_ls.builtins.diagnostics.commitlint,
          -- null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.diagnostics.fish,
          null_ls.builtins.diagnostics.flake8,
          null_ls.builtins.diagnostics.luacheck,
          null_ls.builtins.diagnostics.markdownlint,
          null_ls.builtins.diagnostics.mypy,
          null_ls.builtins.diagnostics.stylelint,
          null_ls.builtins.formatting.autopep8,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.codespell,
          null_ls.builtins.formatting.deno_fmt,
          null_ls.builtins.formatting.eslint,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.lua_format,
          null_ls.builtins.formatting.stylelint,
        },
        on_attach = function(client, bufnr)
          -- Format on save (not async, safer)
          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({
                  bufnr = bufnr,
                  filter = function(filterClient)
                    return filterClient.name == 'null-ls'
                  end,
                })
              end,
            })
          end
        end,
      })
    end,
  })
end

return function(use)
  -- TODO: Document.
  vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

  -- TODO: Document.
  vim.opt.updatetime = 300

  -- TODO: Document.
  vim.opt.shortmess:append('c')

  astparser(use)
  completepairs(use)
  copilot(use)
  diagnosticsigns(use)
  languageServerProtocol(use)
end
