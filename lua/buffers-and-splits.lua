local foldMode = require('lib.fold-mode')

local fileTabs = function(use)
  use({
    'akinsho/bufferline.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- TODO: configure. https://github.com/akinsho/bufferline.nvim
      require('bufferline').setup({
        options = {
          mode = 'buffers',
          diagnostics = 'nvim_lsp',
          offsets = { { filetype = 'NvimTree', text = 'File Explorer', highlight = 'Directory', separator = true } },
        },
      })
    end,
  })
end

local codeFolding = function(use)
  local whichkey = require('which-key')

  -- Folds
  vim.opt.foldenable = true

  -- Don't ignore anything (e.g. comments) when making folds
  vim.opt.foldignore = ''

  whichkey.register({
    F = {
      name = 'Fold',
      c = { foldMode.classFoldMode, 'Class' },
      d = { foldMode.defaultFoldMode, 'Default' },
      f = { foldMode.functionFoldMode, 'Function' },
    },
  }, { prefix = '<leader>' })

  foldMode.defaultFoldMode()
end

local buffers = function(use)
  local whichkey = require('which-key')

  -- don't wrap lines
  vim.opt.wrap = false

  vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<cr>', {})
  vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<cr>', {})

  whichkey.register({
    b = {
      name = 'Buffers',
      b = { '<cmd>Telescope buffers<cr>', 'Buffers' },
      d = { '<cmd>bd<cr>', 'Delete' },
      n = { '<cmd>BufferLineCycleNext<cr>', 'Next' },
      p = { '<cmd>BufferLineCyclePrev<cr>', 'Previous' },
    },
  }, { prefix = '<leader>' })

  fileTabs(use)
  codeFolding(use)
end

local splits = function(use)
  local whichkey = require('which-key')

  -- Splitting a window horizontally (:split) will put the new window below the current one.
  vim.opt.splitbelow = true

  -- Splitting a window vertically (:vsplit) will put the new window to the right of the current one.
  vim.opt.splitright = true

  -- move through splits
  vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
  vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
  vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
  vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

  whichkey.register({
    w = {
      name = 'Window',
      c = { '<C-W>c', 'Close' },
      h = { '<C-W>h', 'Left' },
      H = { '<C-W>5>', 'Left (Resize)' },
      j = { '<C-W>j', 'Down' },
      J = { ':resize +5', 'Down (Resize)' },
      k = { '<C-W>k', 'Up' },
      K = { ':resize -5', 'Up (Resize)' },
      l = { '<C-W>l', 'Right' },
      L = { '<C-W>5<', 'Right (Resize)' },
      ['='] = { '<C-W>=', 'Balance' },
      s = { '<C-W>s', 'Horizontal' },
      ['-'] = { '<C-W>s', 'Horizontal' },
      v = { '<C-W>v', 'Vertical' },
      ['|'] = { '<C-W>v', 'Vertical' },
    },
  }, { prefix = '<leader>' })
end

local closeFile = function(use)
  -- Keep splits open when closing a buffer.
  use({ 'Industrial/vim-smartbd' })

  vim.keymap.set('n', '<C-q>', ':SmartBd<cr>', { noremap = true })
end

local copyPaste = function(use)
  -- Global copy/paste register delete/yank/paste in normal mode.
  vim.keymap.set('n', '<leader>d', '"+d', {})
  vim.keymap.set('n', '<leader>y', '"+y', {})
  vim.keymap.set('n', '<leader>p', '"+p', {})

  -- Mouse copy/paste register delete/yank/paste in normal mode.
  vim.keymap.set('n', '<leader>D', '"*d', {})
  vim.keymap.set('n', '<leader>Y', '"*y', {})
  vim.keymap.set('n', '<leader>P', '"*p', {})

  -- Global copy/paste register delete/yank/paste in visual mode.
  -- vim.keymap.set('v', '<C-v>', '"+p', {})
  -- vim.keymap.set('v', '<C-c>', '"+y', {})
  -- vim.keymap.set('v', '<C-x>', '"+d', {})
  -- vim.keymap.set('i', '<C-v>', '"+p', {})

  -- Paste from Global Copy/Paste Register in Insert Mode.
  -- vim.keymap.set('i', '<C-v>', '<c-r>+', {})
end

local lineNumbers = function(use)
  vim.opt.number = true
  vim.opt.relativenumber = true
end

local saveFile = function(use)
  vim.keymap.set('n', '<C-s>', ':write<cr>', {})
  vim.keymap.set('i', '<C-s>', '<esc>:write<cr>a', {})
end

local indentationGuides = function(use)
  use({
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({ show_current_context = true, show_current_context_start = true })
    end,
  })
end

local fileTreeSidebar = function(use)
  use({
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    -- tag = 'nightly'
    config = function()
      local whichkey = require('which-key')
      local nvimtree = require('nvim-tree')

      -- TODO: :help nvim-tree-setup
      nvimtree.setup({
        disable_netrw = true,
        sync_root_with_cwd = true,
        reload_on_bufenter = true,
        sort_by = 'case_sensitive',
        view = {
          adaptive_size = true,
          -- mappings = {
          --  list = {
          --    { key = 'u', action = 'dir_up' },
          --  },
          -- },
        },
        renderer = { group_empty = true },
        filters = { dotfiles = false },
      })

      whichkey.register({
        t = {
          name = 'Tree',
          t = { '<cmd>NvimTreeToggle<cr>', 'Toggle' },
          f = { '<cmd>NvimTreeFindFile<cr>', 'Find File' },
          c = { '<cmd>NvimTreeCollapseKeepBuffers<cr>', 'Collapse & Keep Buffers' },
          C = { '<cmd>NvimTreeCollapse<cr>', 'Collapse' },
        },
      }, { prefix = '<leader>' })
    end,
  })
end

local statusLine = function(use)
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      -- TODO: https://github.com/nvim-lualine/lualine.nvim#setting-a-theme
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = { statusline = {}, winbar = {} },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = { statusline = 1000, tabline = 1000, winbar = 1000 },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      })
    end,
  })
end

return function(use)
  -- load filetype plugins, indentation and turn syntax highlighting on
  vim.cmd('filetype plugin indent on')

  -- Buffers in the background.
  vim.opt.hidden = true

  buffers(use)
  splits(use)

  closeFile(use)
  copyPaste(use)
  lineNumbers(use)
  saveFile(use)

  fileTreeSidebar(use)
  indentationGuides(use)
  statusLine(use)
end
