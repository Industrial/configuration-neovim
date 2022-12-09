-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/tom/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/tom/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/tom/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/tom/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/tom/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["base16-vim"] = {
    loaded = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/base16-vim",
    url = "https://github.com/chriskempson/base16-vim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n”\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\4\ttext\18File Explorer\14separator\2\rfiletype\rNvimTree\14highlight\14Directory\1\0\2\16diagnostics\rnvim_lsp\tmode\fbuffers\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/tom/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/tom/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "/home/tom/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/tom/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/tom/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    config = { "\27LJ\2\ny\0\0\b\0\t\0\0156\0\0\0009\0\1\0009\0\2\0009\0\3\0004\2\0\0005\3\4\0005\4\b\0006\5\0\0009\5\5\0059\5\6\5'\a\a\0B\5\2\2>\5\1\4B\0\4\1K\0\1\0\1\3\0\0\0\3\0\6$\tline\afn\1\3\0\0\3\0\3\0\21range_formatting\bbuf\blsp\bvimÄ\1\0\1\5\2\6\0\v9\1\0\0+\2\1\0=\2\1\1-\1\0\0009\1\2\0019\1\3\0015\3\4\0-\4\1\0=\4\5\3B\1\2\1K\0\1\0\1¿\2¿\17capabilities\1\0\0\nsetup\rtsserver\24document_formatting\26resolved_capabilitiesﬁ\30\1\0\14\0Ã\1\0‚\0026\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\2B\2\1\0025\3\5\0006\4\6\0009\4\a\0049\4\b\4'\6\t\0'\a\n\0006\b\6\0009\b\v\b9\b\f\b9\b\r\b5\t\14\0B\4\5\0019\4\15\0019\4\16\0045\6\17\0=\2\18\6=\3\19\6B\4\2\0019\4\20\0019\4\16\0045\6\21\0=\2\18\6=\3\19\6B\4\2\0019\4\22\0019\4\16\0045\6\23\0=\2\18\6=\3\19\0065\a\24\0=\a\25\0065\a\26\0=\a\27\0065\a\29\0005\b\28\0=\b\30\a=\a\31\6B\4\2\0019\4 \0019\4\16\0045\6!\0=\2\18\6=\3\19\6B\4\2\0019\4\"\0019\4\16\0045\6#\0=\2\18\0065\a$\0=\a\25\6=\3\19\6B\4\2\0019\4%\0019\4\16\0045\6&\0=\2\18\0065\a'\0=\a\25\6=\3\19\6B\4\2\0019\4(\0019\4\16\0045\6)\0=\2\18\6=\3\19\0065\a*\0006\b\6\0009\b+\b9\b,\b'\n-\0B\b\2\2'\t.\0&\b\t\b>\b\2\a=\a\25\6B\4\2\0019\4/\0019\4\16\0045\0060\0=\2\18\6=\3\19\0065\a1\0=\a\25\6B\4\2\0019\0042\0019\4\16\0045\0063\0=\2\18\6=\3\19\0065\a4\0=\a\25\6B\4\2\0019\0045\0019\4\16\0045\0066\0=\2\18\6=\3\19\0065\a8\0004\b\3\0003\t7\0>\t\1\b=\b9\a=\a:\6B\4\2\0019\4;\0019\4\16\0045\6<\0=\2\18\6=\3\19\0065\a=\0=\a\25\0065\aO\0005\bC\0005\t>\0006\n\6\0009\n?\n6\f@\0009\fA\f'\rB\0B\n\3\2=\nA\t=\tD\b5\tF\0005\nE\0=\nG\t=\tH\b5\tL\0004\n\0\b6\v\6\0009\v+\v9\vI\v'\rJ\0B\v\2\2+\f\2\0<\f\v\n6\v\6\0009\v+\v9\vI\v'\rK\0B\v\2\2+\f\2\0<\f\v\n=\nM\t=\tN\b=\bP\a=\aQ\6B\4\2\0019\4R\0019\4\16\0045\6S\0=\2\18\6=\3\19\0065\aT\0=\a\25\0065\aU\0=\a\27\6B\4\2\0019\4V\0019\4\16\0045\6W\0=\2\18\6=\3\19\0063\aX\0=\aY\6B\4\2\0019\4Z\0019\4\16\0045\6[\0=\2\18\6=\3\19\0065\a\\\0=\a\25\0065\a]\0=\a\27\0065\a_\0005\b^\0=\b`\a5\ba\0005\tb\0=\tc\b=\bd\a5\be\0=\bf\a=\a\31\6B\4\2\0019\4g\0019\4\16\0045\6h\0=\2\18\6=\3\19\0065\ai\0=\a\25\0065\aj\0=\a\27\0065\ak\0005\bl\0=\bm\a=\a\31\6B\4\2\0019\4n\0019\4\16\0045\6o\0=\2\18\6=\3\19\0065\ap\0=\a\25\0065\aq\0=\a\27\0065\aß\0005\bs\0005\tr\0=\tt\b5\tu\0=\tv\b5\tw\0=\tx\b5\ty\0=\tz\b5\t{\0=\t|\b5\t}\0=\t~\b5\t\127\0=\tÄ\b5\tÅ\0=\tÇ\b5\tÉ\0=\tÑ\b5\tÖ\0=\tÜ\b5\tá\0=\tà\b5\tâ\0=\tä\b5\tã\0=\tå\b5\tç\0=\té\b5\tè\0=\tê\b5\të\0=\tí\b5\tì\0=\tî\b5\tï\0=\tñ\b5\tó\0=\tò\b5\tô\0=\tö\b5\tõ\0=\tú\b5\tù\0=\tû\b5\tü\0=\t†\b5\t°\0=\t¢\b5\t£\0=\t§\b5\t•\0=\t¶\b=\b®\a=\a\31\6B\4\2\0019\4©\0019\4\16\0045\6™\0=\2\18\6=\3\19\0065\a´\0=\a\25\0065\a¨\0=\a\27\0065\aÆ\0005\b≠\0=\bØ\a=\a\31\6B\4\2\0019\4∞\0005\6…\0005\a±\0005\b≥\0006\t\6\0009\t\v\t9\t\f\t9\t≤\t>\t\1\b=\b¥\a5\b∂\0006\t\6\0009\t\v\t9\t\f\t9\tµ\t>\t\1\b=\b∑\a5\b∏\0006\t\6\0009\t\v\t9\t\f\t9\t\r\t>\t\1\b=\bπ\a5\bª\0006\t\6\0009\t\v\t9\t\f\t9\t∫\t>\t\1\b=\bº\a5\bæ\0006\t\6\0009\t\v\t9\t\f\t9\tΩ\t>\t\1\b=\bø\a5\b¡\0006\t\6\0009\t\v\t9\t\f\t9\t¿\t>\t\1\b=\b¬\a5\bƒ\0006\t\6\0009\t\v\t9\t\f\t9\t√\t>\t\1\b=\b≈\a5\b«\0006\t\6\0009\t\v\t9\t\f\t9\t∆\t>\t\1\b=\b»\a=\a \0065\aÀ\0B\4\3\0012\0\0ÄK\0\1\0\1\0\1\vprefix\r<leader>\6l\1\0\0\6k\1\3\0\0\0\19Signature Help\19signature_help\6a\1\3\0\0\0\16Code Action\16code_action\6R\1\3\0\0\0\vRename\vrename\6r\1\3\0\0\0\15References\15references\6i\1\3\0\0\0\19Implementation\19implementation\6h\1\3\0\0\0\nHover\6D\1\3\0\0\0\16Declaration\16declaration\6d\1\3\0\0\0\15Definition\15definition\1\0\1\tname\bLSP\rregister\ranalysis\1\0\0\1\0\4\19diagnosticMode\14workspace\20autoSearchPaths\2\26autoImportCompletions\2\27useLibraryCodeForTypes\2\1\2\0\0\vpython\1\3\0\0\23pyright-langserver\f--stdio\1\0\0\fpyright\fplugins\1\0\0\27rope_workspace_symbols\1\0\1\fenabled\2\25rope_implementations\1\0\1\fenabled\2\26rope_document_symbols\1\0\1\fenabled\2\20rope_definition\1\0\1\fenabled\2\17rope_symbols\1\0\1\fenabled\2\24rope_signature_help\1\0\1\fenabled\2\20rope_references\1\0\1\fenabled\2\16rope_rename\1\0\1\fenabled\2\15rope_hover\1\0\1\fenabled\2\20rope_completion\1\0\1\fenabled\2\fpreload\1\0\1\fenabled\2\vmccabe\1\0\1\fenabled\2\vpylint\1\0\1\fenabled\2\rpyflakes\1\0\1\fenabled\2\15pydocstyle\1\0\1\fenabled\2\16pycodestyle\1\0\1\fenabled\2\27jedi_workspace_symbols\1\0\1\fenabled\2\16jedi_rename\1\0\1\fenabled\2\25jedi_implementations\1\0\1\fenabled\2\26jedi_document_symbols\1\0\1\fenabled\2\20jedi_definition\1\0\1\fenabled\2\17jedi_symbols\1\0\1\fenabled\2\24jedi_signature_help\1\0\1\fenabled\2\20jedi_references\1\0\1\fenabled\2\15jedi_hover\1\0\1\fenabled\2\20jedi_completion\1\0\0\1\0\1\fenabled\2\1\2\0\0\vpython\1\2\0\0\npylsp\1\0\0\npylsp\vformat\1\0\1\venable\2\1\0\3\rvalidate\2\15completion\2\nhover\2\1\2\0\0\tyaml\1\3\0\0\25yaml-language-server\f--stdio\1\0\0\vyamlls\fsuggest\1\0\2\19fromVimruntime\2\20fromRuntimepath\2\findexes\24projectRootPatterns\1\6\0\0\fruntime\tnvim\t.git\rautoload\vplugin\1\0\2\bgap\3d\ncount\3\3\15diagnostic\1\0\3\14iskeyword\25@,48-57,_,192-255,-#\16runtimepath\5\15vimruntime\5\1\0\1\venable\2\1\2\0\0\bvim\1\3\0\0\24vim-language-server\f--stdio\1\0\0\nvimls\14on_attach\0\1\0\0\rtsserver\1\4\0\0\bcss\tscss\tless\1\3\0\0\18stylelint-lsp\f--stdio\1\0\0\18stylelint_lsp\rsettings\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\vexpand\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\6;\tpath\fpackage\nsplit\1\0\1\fversion\vLuaJIT\1\2\0\0\24lua-language-server\1\0\0\16sumneko_lua\rcommands\vFormat\1\0\0\0\1\0\0\vjsonls\1\3\0\0 vscode-html-language-server\f--stdio\1\0\0\thtml\1\5\0\0\16graphql-lsp\vserver\a-m\vstream\1\0\0\fgraphql@/lspinstall/eslint/node_modules/.bin/eslint-language-server\tdata\fstdpath\afn\1\4\0\0\tnode\0\f--stdio\1\0\0\veslint\1\3\0\0\24dot-language-server\f--stdio\1\0\0\ndotls\1\3\0\0\22docker-langserver\f--stdio\1\0\0\rdockerls\1\0\0\18cssmodules_ls\17init_options\22embeddedLanguages\1\0\0\1\0\5\tless\2\tscss\2\bcss\2\15typescript\2\15javascript\2\14filetypes\1\4\0\0\bcss\tscss\tless\bcmd\1\3\0\0\23css-languageserver\f--stdio\1\0\0\ncssls\1\0\0\29cucumber_language_server\nflags\17capabilities\1\0\0\nsetup\vbashls\1\0\2\vsilent\2\fnoremap\2\nhover\bbuf\blsp\6K\6n\bset\vkeymap\bvim\1\0\1\26debounce_text_changes\3ñ\1\25default_capabilities\17cmp_nvim_lsp\14lspconfig\14which-key\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/tom/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "/home/tom/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/tom/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["copilot.vim"] = {
    config = { "\27LJ\2\nÅ\1\0\0\4\0\6\0\0176\0\0\0009\0\1\0009\0\2\0B\0\1\2\r\1\0\0X\1\nÄ6\1\3\0009\1\4\0019\3\5\0B\1\2\2)\2\0\0\0\2\1\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\ttext\blen\vstring#copilot#GetDisplayedSuggestion\afn\bvime\0\0\2\1\4\0\14-\0\0\0B\0\1\2\15\0\0\0X\1\5Ä6\0\0\0009\0\1\0009\0\2\0B\0\1\1X\0\4Ä6\0\0\0009\0\1\0009\0\3\0B\0\1\1K\0\1\0\0¿\20copilot#Suggest\17copilot#Next\afn\bvim3\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\21copilot#Previous\afn\bvim^\0\0\2\1\4\0\14-\0\0\0B\0\1\2\15\0\0\0X\1\aÄ6\0\0\0009\0\1\0009\0\2\0B\0\1\1'\0\3\0L\0\2\0X\0\2Ä'\0\3\0L\0\2\0K\0\1\0\0¿\n<esc>\20copilot#Dismiss\afn\bvimÑ\4\1\0\n\0\24\0Z6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0003\0\5\0003\1\6\0003\2\a\0003\3\b\0006\4\0\0009\4\t\0049\4\n\4'\6\v\0'\a\f\0'\b\r\0B\4\4\0016\4\0\0009\4\t\0049\4\14\4'\6\v\0'\a\f\0B\4\3\0016\4\0\0009\4\t\0049\4\n\4'\6\v\0'\a\15\0'\b\r\0B\4\4\0016\4\0\0009\4\t\0049\4\14\4'\6\v\0'\a\15\0B\4\3\0016\4\0\0009\4\t\0049\4\n\4'\6\v\0'\a\16\0'\b\r\0B\4\4\0016\4\0\0009\4\t\0049\4\14\4'\6\v\0'\a\16\0B\4\3\0016\4\0\0009\4\t\0049\4\n\4'\6\v\0'\a\17\0'\b\r\0B\4\4\0016\4\0\0009\4\t\0049\4\14\4'\6\v\0'\a\17\0B\4\3\0016\4\0\0009\4\t\0049\4\n\4'\6\v\0'\a\18\0\18\b\1\0005\t\19\0B\4\5\0016\4\0\0009\4\t\0049\4\n\4'\6\v\0'\a\20\0\18\b\2\0005\t\21\0B\4\5\0016\4\0\0009\4\t\0049\4\n\4'\6\v\0'\a\22\0\18\b\3\0005\t\23\0B\4\5\0012\0\0ÄK\0\1\0\1\0\2\texpr\2\vscript\2\n<esc>\1\0\1\vscript\2\n<C-k>\1\0\1\vscript\2\n<C-j>\n<M-\\>\n<M-[>\n<M-]>\bdel\5\n<C-]>\6i\bset\vkeymap\0\0\0\0\1\0\1\6*\2\22copilot_filetypes\20copilot_enabled\6g\bvim-\1\0\4\0\3\0\0066\0\0\0009\0\1\0003\2\2\0)\3d\0B\0\3\1K\0\1\0\0\rdefer_fn\bvim\0" },
    loaded = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox-baby"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\29colorscheme gruvbox-baby\bcmd\bvim\0" },
    loaded = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/gruvbox-baby",
    url = "https://github.com/luisiacc/gruvbox-baby"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nw\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\25show_current_context\2\31show_current_context_start\2\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lspkind.nvim"] = {
    after = { "nvim-cmp" },
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\tinit\flspkind\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nì\6\0\0\6\0&\0;6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0004\5\0\0=\5\t\0044\5\0\0=\5\n\4=\4\v\0034\4\0\0=\4\f\0035\4\r\0=\4\14\3=\3\16\0025\3\18\0005\4\17\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\3=\3\30\0025\3\31\0004\4\0\0=\4\19\0034\4\0\0=\4\21\0035\4 \0=\4\23\0035\4!\0=\4\25\0034\4\0\0=\4\27\0034\4\0\0=\4\29\3=\3\"\0024\3\0\0=\3#\0024\3\0\0=\3\n\0024\3\0\0=\3$\0024\3\0\0=\3%\2B\0\2\1K\0\1\0\15extensions\20inactive_winbar\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\frefresh\1\0\3\ftabline\3Ë\a\vwinbar\3Ë\a\15statusline\3Ë\a\17ignore_focus\23disabled_filetypes\vwinbar\15statusline\1\0\0\23section_separators\1\0\2\tleft\bÓÇ∞\nright\bÓÇ≤\25component_separators\1\0\2\tleft\bÓÇ±\nright\bÓÇ≥\1\0\4\ntheme\tauto\18icons_enabled\2\17globalstatus\1\25always_divide_middle\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n0\0\1\2\0\2\0\a9\1\0\0\6\1\1\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\fnull-ls\tnameY\1\0\4\1\b\0\v6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\0023\3\6\0=\3\a\2B\0\2\1K\0\1\0\1¿\vfilter\0\nbufnr\1\0\0\vformat\bbuf\blsp\bvimÚ\1\1\2\a\1\r\0\0269\2\0\0'\4\1\0B\2\2\2\15\0\2\0X\3\19Ä6\2\2\0009\2\3\0029\2\4\0025\4\5\0-\5\0\0=\5\6\4=\1\a\4B\2\2\0016\2\2\0009\2\3\0029\2\b\2'\4\t\0005\5\n\0-\6\0\0=\6\6\5=\1\a\0053\6\v\0=\6\f\5B\2\3\0012\0\0ÄK\0\1\0\1¿\rcallback\0\1\0\0\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\bapi\bvim\28textDocument/formatting\20supports_method„\5\1\0\a\0#\0j6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0004\4\0\0B\1\3\0029\2\6\0005\4\31\0004\5\23\0009\6\a\0009\6\b\0069\6\t\6>\6\1\0059\6\a\0009\6\b\0069\6\n\6>\6\2\0059\6\a\0009\6\b\0069\6\v\6>\6\3\0059\6\a\0009\6\b\0069\6\f\6>\6\4\0059\6\a\0009\6\b\0069\6\r\6>\6\5\0059\6\a\0009\6\14\0069\6\15\6>\6\6\0059\6\a\0009\6\16\0069\6\17\6>\6\a\0059\6\a\0009\6\16\0069\6\18\6>\6\b\0059\6\a\0009\6\16\0069\6\19\6>\6\t\0059\6\a\0009\6\16\0069\6\20\6>\6\n\0059\6\a\0009\6\16\0069\6\21\6>\6\v\0059\6\a\0009\6\16\0069\6\22\6>\6\f\0059\6\a\0009\6\16\0069\6\23\6>\6\r\0059\6\a\0009\6\16\0069\6\24\6>\6\14\0059\6\a\0009\6\25\0069\6\26\6>\6\15\0059\6\a\0009\6\25\0069\6\27\6>\6\16\0059\6\a\0009\6\25\0069\6\17\6>\6\17\0059\6\a\0009\6\25\0069\6\28\6>\6\18\0059\6\a\0009\6\25\0069\6\t\6>\6\19\0059\6\a\0009\6\25\0069\6\29\6>\6\20\0059\6\a\0009\6\25\0069\6\30\6>\6\21\0059\6\a\0009\6\25\0069\6\24\6>\6\22\5=\5 \0043\5!\0=\5\"\4B\2\2\0012\0\0ÄK\0\1\0\14on_attach\0\fsources\1\0\0\15lua_format\nisort\rdeno_fmt\nblack\rautopep8\15formatting\14stylelint\tmypy\17markdownlint\rluacheck\vflake8\tfish\15commitlint\14codespell\16diagnostics\nspell\15completion\15shellcheck\16refactoring\rgitsigns\14gitrebase\veslint\17code_actions\rbuiltins\nsetup\18LspFormatting\24nvim_create_augroup\bapi\bvim\fnull-ls\frequire\0" },
    loaded = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-buffer", "cmp-cmdline", "cmp-path", "nvim-lspconfig" },
    config = { "\27LJ\2\nÒ\b\0\0\v\0008\0ì\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\17\0005\5\4\0004\6\n\0009\a\5\0009\a\6\a9\a\a\a>\a\1\0069\a\5\0009\a\6\a9\a\b\a>\a\2\0069\a\5\0009\a\6\a9\a\t\a>\a\3\0069\a\5\0009\a\6\a9\a\n\a>\a\4\0069\a\5\0009\a\6\a9\a\v\a>\a\5\0069\a\5\0009\a\6\a9\a\f\a>\a\6\0069\a\5\0009\a\6\a9\a\r\a>\a\a\0069\a\5\0009\a\6\a9\a\14\a>\a\b\0069\a\5\0009\a\6\a9\a\15\a>\a\t\6=\6\16\5=\5\18\0045\5\22\0009\6\19\0015\b\20\0004\t\0\0=\t\21\bB\6\2\2=\6\23\5=\5\24\0049\5\25\0009\5\26\0059\5\27\0055\a\29\0009\b\25\0009\b\28\b)\n¸ˇB\b\2\2=\b\30\a9\b\25\0009\b\28\b)\n\4\0B\b\2\2=\b\31\a9\b\25\0009\b \bB\b\1\2=\b!\a9\b\25\0009\b\"\bB\b\1\2=\b#\a9\b\25\0009\b$\b5\n%\0B\b\2\2=\b&\aB\5\2\2=\5\25\0049\5\5\0009\5'\0054\a\4\0005\b(\0>\b\1\a5\b)\0>\b\2\a5\b*\0>\b\3\aB\5\2\2=\5'\4B\2\2\0019\2\3\0009\2+\2'\4,\0005\5/\0009\6\5\0009\6'\0064\b\3\0005\t-\0>\t\1\b4\t\3\0005\n.\0>\n\1\tB\6\3\2=\6'\5B\2\3\0019\2\3\0009\0020\0025\0041\0005\0052\0009\6\25\0009\6\26\0069\0060\6B\6\1\2=\6\25\0054\6\3\0005\a3\0>\a\1\6=\6'\5B\2\3\0019\2\3\0009\0020\2'\0044\0005\0055\0009\6\25\0009\6\26\0069\0060\6B\6\1\2=\6\25\0059\6\5\0009\6'\0064\b\3\0005\t6\0>\t\1\b4\t\3\0005\n7\0>\n\1\tB\6\3\2=\6'\5B\2\3\1K\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\1\3\0\0\6/\6?\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\2\16group_index\3\2\tname\vbuffer\1\0\2\16group_index\3\2\tname\tpath\1\0\2\16group_index\3\2\tname\rnvim_lsp\fsources\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\15formatting\vformat\1\0\0\vsymbol\1\0\2\tmode\vsymbol\14max_width\0032\15cmp_format\fsorting\1\0\0\16comparators\norder\vlength\14sort_text\tkind\rlocality\18recently_used\nscore\nexact\voffset\fcompare\vconfig\1\0\1\20priority_weight\3\2\nsetup\flspkind\bcmp\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/tom/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-lspconfig"] = {
    after = { "cmp-nvim-lsp" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/tom/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nû\4\0\0\a\0\23\0\0306\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0015\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\4B\2\2\0019\2\v\0005\4\21\0005\5\f\0005\6\r\0=\6\14\0055\6\15\0=\6\16\0055\6\17\0=\6\18\0055\6\19\0=\6\20\5=\5\14\0045\5\22\0B\2\3\1K\0\1\0\1\0\1\vprefix\r<leader>\1\0\0\6C\1\3\0\0\30<cmd>NvimTreeCollapse<cr>\rCollapse\6c\1\3\0\0)<cmd>NvimTreeCollapseKeepBuffers<cr>\28Collapse & Keep Buffers\6f\1\3\0\0\30<cmd>NvimTreeFindFile<cr>\14Find File\6t\1\3\0\0\28<cmd>NvimTreeToggle<cr>\vToggle\1\0\1\tname\tTree\rregister\ffilters\1\0\1\rdotfiles\1\rrenderer\1\0\1\16group_empty\2\tview\1\0\1\18adaptive_size\2\1\0\4\fsort_by\19case_sensitive\23reload_on_bufenter\2\23sync_root_with_cwd\2\18disable_netrw\2\nsetup\14nvim-tree\14which-key\frequire\0" },
    loaded = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nü\2\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\14autopairs\1\0\1\venable\2\frainbow\1\0\2\18extended_mode\1\venable\2\fautotag\1\0\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\1\0\3\17auto_install\2\17sync_install\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["refactoring.nvim"] = {
    loaded = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\vhidden\2\15find_filesâ\n\1\0\v\0L\0t6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\3\4\0005\5\a\0005\6\5\0004\a\0\0=\a\6\6=\6\b\0054\6\0\0=\6\t\0054\6\0\0=\6\n\5B\3\2\0013\3\v\0009\4\f\0025\6J\0005\a\r\0005\b\15\0009\t\14\1>\t\1\b=\b\16\a5\b\18\0009\t\17\1>\t\1\b=\b\19\a5\b\21\0009\t\20\1>\t\1\b=\b\22\a5\b\24\0009\t\23\1>\t\1\b=\b\25\a5\b\26\0005\t\28\0009\n\27\1>\n\1\t=\t\22\b5\t\30\0009\n\29\1>\n\1\t=\t\25\b5\t \0009\n\31\1>\n\1\t=\t!\b5\t#\0009\n\"\1>\n\1\t=\t$\b5\t&\0009\n%\1>\n\1\t=\t'\b=\b(\a5\b*\0009\t)\1>\t\1\b=\b+\a5\b-\0009\t,\1>\t\1\b=\b.\a5\b/\0>\3\1\b=\b0\a5\b2\0009\t1\1>\t\1\b=\b3\a5\b5\0009\t4\1>\t\1\b=\b6\a5\b7\0005\t9\0009\n8\1>\n\1\t=\t:\b5\t<\0009\n;\1>\n\1\t=\t!\b5\t>\0009\n=\1>\n\1\t=\t'\b5\t@\0009\n?\1>\n\1\t=\tA\b5\tC\0009\nB\1>\n\1\t=\t6\b5\tE\0009\nD\1>\n\1\t=\t$\b5\tG\0009\nF\1>\n\1\t=\tH\b=\bI\a=\a+\0065\aK\0B\4\3\0012\0\0ÄK\0\1\0\1\0\1\vprefix\r<leader>\1\0\0\6l\6w\1\3\0\0\0\22workspace symbols\26lsp_workspace_symbols\1\3\0\0\0\21document symbols\25lsp_document_symbols\1\3\0\0\0\15references\19lsp_references\6i\1\3\0\0\0\20implementations\24lsp_implementations\1\3\0\0\0\21type definitions\25lsp_type_definitions\1\3\0\0\0\16definitions\20lsp_definitions\6a\1\3\0\0\0\17code actions\21lsp_code_actions\1\0\1\tname\bLSP\6r\1\3\0\0\0\14registers\14registers\6q\1\3\0\0\0\rquickfix\rquickfix\6p\1\3\0\0\0\nfiles\6h\1\3\0\0\0\14help tags\14help_tags\6f\1\3\0\0\0\rin files\14live_grep\6g\6t\1\3\0\0\0\nstash\14git_stash\6s\1\3\0\0\0\vstatus\15git_status\6d\1\3\0\0\0\tdiff\17git_bcommits\1\3\0\0\0\fcommits\16git_commits\1\3\0\0\0\rbranches\17git_branches\1\0\1\tname\bGit\6c\1\3\0\0\0\rcommands\rcommands\6b\1\3\0\0\0\fbuffers\fbuffers\6/\1\3\0\0\0\14in buffer\30current_buffer_fuzzy_find\6C\1\3\0\0\0\20command history\20command_history\1\0\1\tname\tFind\rregister\0\15extensions\fpickers\rdefaults\1\0\0\rmappings\1\0\0\nsetup\14which-key\22telescope.builtin\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n¥\4\0\0\a\0\21\0\0286\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0015\4\4\0B\2\2\0019\2\5\0005\4\19\0005\5\6\0005\6\a\0=\6\b\0055\6\t\0=\6\n\0055\6\v\0=\6\f\0055\6\r\0=\6\14\0055\6\15\0=\6\16\0055\6\17\0=\6\18\5=\5\b\0045\5\20\0B\2\3\1K\0\1\0\1\0\1\vprefix\r<leader>\1\0\0\6R\1\3\0\0*<cmd>TroubleToggle lsp_references<cr>\15References\6q\1\3\0\0$<cmd>TroubleToggle quickfix<cr>\rQuickfix\6l\1\3\0\0#<cmd>TroubleToggle loclist<cr>\fLoclist\6d\1\3\0\0000<cmd>TroubleToggle document_diagnostics<cr>\rDocument\6w\1\3\0\0001<cmd>TroubleToggle workspace_diagnostics<cr>\14Workspace\6x\1\3\0\0\27<cmd>TroubleToggle<cr>\vToggle\1\0\1\tname\rQuickfix\rregister\1\0\4\14auto_open\2\25use_diagnostic_signs\2\17auto_preview\2\15auto_close\2\nsetup\ftrouble\14which-key\frequire\0" },
    loaded = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-smartbd"] = {
    loaded = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/vim-smartbd",
    url = "https://github.com/Industrial/vim-smartbd"
  },
  ["which-key.nvim"] = {
    after = { "telescope.nvim" },
    config = { "\27LJ\2\n;\0\0\4\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/tom/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: lspkind.nvim
time([[Config for lspkind.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\tinit\flspkind\frequire\0", "config", "lspkind.nvim")
time([[Config for lspkind.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nw\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\25show_current_context\2\31show_current_context_start\2\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n”\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\4\ttext\18File Explorer\14separator\2\rfiletype\rNvimTree\14highlight\14Directory\1\0\2\16diagnostics\rnvim_lsp\tmode\fbuffers\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: copilot.vim
time([[Config for copilot.vim]], true)
try_loadstring("\27LJ\2\nÅ\1\0\0\4\0\6\0\0176\0\0\0009\0\1\0009\0\2\0B\0\1\2\r\1\0\0X\1\nÄ6\1\3\0009\1\4\0019\3\5\0B\1\2\2)\2\0\0\0\2\1\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\ttext\blen\vstring#copilot#GetDisplayedSuggestion\afn\bvime\0\0\2\1\4\0\14-\0\0\0B\0\1\2\15\0\0\0X\1\5Ä6\0\0\0009\0\1\0009\0\2\0B\0\1\1X\0\4Ä6\0\0\0009\0\1\0009\0\3\0B\0\1\1K\0\1\0\0¿\20copilot#Suggest\17copilot#Next\afn\bvim3\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\21copilot#Previous\afn\bvim^\0\0\2\1\4\0\14-\0\0\0B\0\1\2\15\0\0\0X\1\aÄ6\0\0\0009\0\1\0009\0\2\0B\0\1\1'\0\3\0L\0\2\0X\0\2Ä'\0\3\0L\0\2\0K\0\1\0\0¿\n<esc>\20copilot#Dismiss\afn\bvimÑ\4\1\0\n\0\24\0Z6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0003\0\5\0003\1\6\0003\2\a\0003\3\b\0006\4\0\0009\4\t\0049\4\n\4'\6\v\0'\a\f\0'\b\r\0B\4\4\0016\4\0\0009\4\t\0049\4\14\4'\6\v\0'\a\f\0B\4\3\0016\4\0\0009\4\t\0049\4\n\4'\6\v\0'\a\15\0'\b\r\0B\4\4\0016\4\0\0009\4\t\0049\4\14\4'\6\v\0'\a\15\0B\4\3\0016\4\0\0009\4\t\0049\4\n\4'\6\v\0'\a\16\0'\b\r\0B\4\4\0016\4\0\0009\4\t\0049\4\14\4'\6\v\0'\a\16\0B\4\3\0016\4\0\0009\4\t\0049\4\n\4'\6\v\0'\a\17\0'\b\r\0B\4\4\0016\4\0\0009\4\t\0049\4\14\4'\6\v\0'\a\17\0B\4\3\0016\4\0\0009\4\t\0049\4\n\4'\6\v\0'\a\18\0\18\b\1\0005\t\19\0B\4\5\0016\4\0\0009\4\t\0049\4\n\4'\6\v\0'\a\20\0\18\b\2\0005\t\21\0B\4\5\0016\4\0\0009\4\t\0049\4\n\4'\6\v\0'\a\22\0\18\b\3\0005\t\23\0B\4\5\0012\0\0ÄK\0\1\0\1\0\2\texpr\2\vscript\2\n<esc>\1\0\1\vscript\2\n<C-k>\1\0\1\vscript\2\n<C-j>\n<M-\\>\n<M-[>\n<M-]>\bdel\5\n<C-]>\6i\bset\vkeymap\0\0\0\0\1\0\1\6*\2\22copilot_filetypes\20copilot_enabled\6g\bvim-\1\0\4\0\3\0\0066\0\0\0009\0\1\0003\2\2\0)\3d\0B\0\3\1K\0\1\0\0\rdefer_fn\bvim\0", "config", "copilot.vim")
time([[Config for copilot.vim]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nû\4\0\0\a\0\23\0\0306\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0015\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\4B\2\2\0019\2\v\0005\4\21\0005\5\f\0005\6\r\0=\6\14\0055\6\15\0=\6\16\0055\6\17\0=\6\18\0055\6\19\0=\6\20\5=\5\14\0045\5\22\0B\2\3\1K\0\1\0\1\0\1\vprefix\r<leader>\1\0\0\6C\1\3\0\0\30<cmd>NvimTreeCollapse<cr>\rCollapse\6c\1\3\0\0)<cmd>NvimTreeCollapseKeepBuffers<cr>\28Collapse & Keep Buffers\6f\1\3\0\0\30<cmd>NvimTreeFindFile<cr>\14Find File\6t\1\3\0\0\28<cmd>NvimTreeToggle<cr>\vToggle\1\0\1\tname\tTree\rregister\ffilters\1\0\1\rdotfiles\1\rrenderer\1\0\1\16group_empty\2\tview\1\0\1\18adaptive_size\2\1\0\4\fsort_by\19case_sensitive\23reload_on_bufenter\2\23sync_root_with_cwd\2\18disable_netrw\2\nsetup\14nvim-tree\14which-key\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nì\6\0\0\6\0&\0;6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0004\5\0\0=\5\t\0044\5\0\0=\5\n\4=\4\v\0034\4\0\0=\4\f\0035\4\r\0=\4\14\3=\3\16\0025\3\18\0005\4\17\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\3=\3\30\0025\3\31\0004\4\0\0=\4\19\0034\4\0\0=\4\21\0035\4 \0=\4\23\0035\4!\0=\4\25\0034\4\0\0=\4\27\0034\4\0\0=\4\29\3=\3\"\0024\3\0\0=\3#\0024\3\0\0=\3\n\0024\3\0\0=\3$\0024\3\0\0=\3%\2B\0\2\1K\0\1\0\15extensions\20inactive_winbar\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\frefresh\1\0\3\ftabline\3Ë\a\vwinbar\3Ë\a\15statusline\3Ë\a\17ignore_focus\23disabled_filetypes\vwinbar\15statusline\1\0\0\23section_separators\1\0\2\tleft\bÓÇ∞\nright\bÓÇ≤\25component_separators\1\0\2\tleft\bÓÇ±\nright\bÓÇ≥\1\0\4\ntheme\tauto\18icons_enabled\2\17globalstatus\1\25always_divide_middle\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nü\2\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\14autopairs\1\0\1\venable\2\frainbow\1\0\2\18extended_mode\1\venable\2\fautotag\1\0\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\1\0\3\17auto_install\2\17sync_install\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: gruvbox-baby
time([[Config for gruvbox-baby]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\29colorscheme gruvbox-baby\bcmd\bvim\0", "config", "gruvbox-baby")
time([[Config for gruvbox-baby]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\4\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n0\0\1\2\0\2\0\a9\1\0\0\6\1\1\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\fnull-ls\tnameY\1\0\4\1\b\0\v6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\0023\3\6\0=\3\a\2B\0\2\1K\0\1\0\1¿\vfilter\0\nbufnr\1\0\0\vformat\bbuf\blsp\bvimÚ\1\1\2\a\1\r\0\0269\2\0\0'\4\1\0B\2\2\2\15\0\2\0X\3\19Ä6\2\2\0009\2\3\0029\2\4\0025\4\5\0-\5\0\0=\5\6\4=\1\a\4B\2\2\0016\2\2\0009\2\3\0029\2\b\2'\4\t\0005\5\n\0-\6\0\0=\6\6\5=\1\a\0053\6\v\0=\6\f\5B\2\3\0012\0\0ÄK\0\1\0\1¿\rcallback\0\1\0\0\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\bapi\bvim\28textDocument/formatting\20supports_method„\5\1\0\a\0#\0j6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0004\4\0\0B\1\3\0029\2\6\0005\4\31\0004\5\23\0009\6\a\0009\6\b\0069\6\t\6>\6\1\0059\6\a\0009\6\b\0069\6\n\6>\6\2\0059\6\a\0009\6\b\0069\6\v\6>\6\3\0059\6\a\0009\6\b\0069\6\f\6>\6\4\0059\6\a\0009\6\b\0069\6\r\6>\6\5\0059\6\a\0009\6\14\0069\6\15\6>\6\6\0059\6\a\0009\6\16\0069\6\17\6>\6\a\0059\6\a\0009\6\16\0069\6\18\6>\6\b\0059\6\a\0009\6\16\0069\6\19\6>\6\t\0059\6\a\0009\6\16\0069\6\20\6>\6\n\0059\6\a\0009\6\16\0069\6\21\6>\6\v\0059\6\a\0009\6\16\0069\6\22\6>\6\f\0059\6\a\0009\6\16\0069\6\23\6>\6\r\0059\6\a\0009\6\16\0069\6\24\6>\6\14\0059\6\a\0009\6\25\0069\6\26\6>\6\15\0059\6\a\0009\6\25\0069\6\27\6>\6\16\0059\6\a\0009\6\25\0069\6\17\6>\6\17\0059\6\a\0009\6\25\0069\6\28\6>\6\18\0059\6\a\0009\6\25\0069\6\t\6>\6\19\0059\6\a\0009\6\25\0069\6\29\6>\6\20\0059\6\a\0009\6\25\0069\6\30\6>\6\21\0059\6\a\0009\6\25\0069\6\24\6>\6\22\5=\5 \0043\5!\0=\5\"\4B\2\2\0012\0\0ÄK\0\1\0\14on_attach\0\fsources\1\0\0\15lua_format\nisort\rdeno_fmt\nblack\rautopep8\15formatting\14stylelint\tmypy\17markdownlint\rluacheck\vflake8\tfish\15commitlint\14codespell\16diagnostics\nspell\15completion\15shellcheck\16refactoring\rgitsigns\14gitrebase\veslint\17code_actions\rbuiltins\nsetup\18LspFormatting\24nvim_create_augroup\bapi\bvim\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n¥\4\0\0\a\0\21\0\0286\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0015\4\4\0B\2\2\0019\2\5\0005\4\19\0005\5\6\0005\6\a\0=\6\b\0055\6\t\0=\6\n\0055\6\v\0=\6\f\0055\6\r\0=\6\14\0055\6\15\0=\6\16\0055\6\17\0=\6\18\5=\5\b\0045\5\20\0B\2\3\1K\0\1\0\1\0\1\vprefix\r<leader>\1\0\0\6R\1\3\0\0*<cmd>TroubleToggle lsp_references<cr>\15References\6q\1\3\0\0$<cmd>TroubleToggle quickfix<cr>\rQuickfix\6l\1\3\0\0#<cmd>TroubleToggle loclist<cr>\fLoclist\6d\1\3\0\0000<cmd>TroubleToggle document_diagnostics<cr>\rDocument\6w\1\3\0\0001<cmd>TroubleToggle workspace_diagnostics<cr>\14Workspace\6x\1\3\0\0\27<cmd>TroubleToggle<cr>\vToggle\1\0\1\tname\rQuickfix\rregister\1\0\4\14auto_open\2\25use_diagnostic_signs\2\17auto_preview\2\15auto_close\2\nsetup\ftrouble\14which-key\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\2\nÒ\b\0\0\v\0008\0ì\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\17\0005\5\4\0004\6\n\0009\a\5\0009\a\6\a9\a\a\a>\a\1\0069\a\5\0009\a\6\a9\a\b\a>\a\2\0069\a\5\0009\a\6\a9\a\t\a>\a\3\0069\a\5\0009\a\6\a9\a\n\a>\a\4\0069\a\5\0009\a\6\a9\a\v\a>\a\5\0069\a\5\0009\a\6\a9\a\f\a>\a\6\0069\a\5\0009\a\6\a9\a\r\a>\a\a\0069\a\5\0009\a\6\a9\a\14\a>\a\b\0069\a\5\0009\a\6\a9\a\15\a>\a\t\6=\6\16\5=\5\18\0045\5\22\0009\6\19\0015\b\20\0004\t\0\0=\t\21\bB\6\2\2=\6\23\5=\5\24\0049\5\25\0009\5\26\0059\5\27\0055\a\29\0009\b\25\0009\b\28\b)\n¸ˇB\b\2\2=\b\30\a9\b\25\0009\b\28\b)\n\4\0B\b\2\2=\b\31\a9\b\25\0009\b \bB\b\1\2=\b!\a9\b\25\0009\b\"\bB\b\1\2=\b#\a9\b\25\0009\b$\b5\n%\0B\b\2\2=\b&\aB\5\2\2=\5\25\0049\5\5\0009\5'\0054\a\4\0005\b(\0>\b\1\a5\b)\0>\b\2\a5\b*\0>\b\3\aB\5\2\2=\5'\4B\2\2\0019\2\3\0009\2+\2'\4,\0005\5/\0009\6\5\0009\6'\0064\b\3\0005\t-\0>\t\1\b4\t\3\0005\n.\0>\n\1\tB\6\3\2=\6'\5B\2\3\0019\2\3\0009\0020\0025\0041\0005\0052\0009\6\25\0009\6\26\0069\0060\6B\6\1\2=\6\25\0054\6\3\0005\a3\0>\a\1\6=\6'\5B\2\3\0019\2\3\0009\0020\2'\0044\0005\0055\0009\6\25\0009\6\26\0069\0060\6B\6\1\2=\6\25\0059\6\5\0009\6'\0064\b\3\0005\t6\0>\t\1\b4\t\3\0005\n7\0>\n\1\tB\6\3\2=\6'\5B\2\3\1K\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\1\3\0\0\6/\6?\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\2\16group_index\3\2\tname\vbuffer\1\0\2\16group_index\3\2\tname\tpath\1\0\2\16group_index\3\2\tname\rnvim_lsp\fsources\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\15formatting\vformat\1\0\0\vsymbol\1\0\2\tmode\vsymbol\14max_width\0032\15cmp_format\fsorting\1\0\0\16comparators\norder\vlength\14sort_text\tkind\rlocality\18recently_used\nscore\nexact\voffset\fcompare\vconfig\1\0\1\20priority_weight\3\2\nsetup\flspkind\bcmp\frequire\0", "config", "nvim-cmp")

vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd cmp-cmdline ]]
vim.cmd [[ packadd nvim-lspconfig ]]
vim.cmd [[ packadd cmp-nvim-lsp ]]

-- Config for: cmp-nvim-lsp
try_loadstring("\27LJ\2\ny\0\0\b\0\t\0\0156\0\0\0009\0\1\0009\0\2\0009\0\3\0004\2\0\0005\3\4\0005\4\b\0006\5\0\0009\5\5\0059\5\6\5'\a\a\0B\5\2\2>\5\1\4B\0\4\1K\0\1\0\1\3\0\0\0\3\0\6$\tline\afn\1\3\0\0\3\0\3\0\21range_formatting\bbuf\blsp\bvimÄ\1\0\1\5\2\6\0\v9\1\0\0+\2\1\0=\2\1\1-\1\0\0009\1\2\0019\1\3\0015\3\4\0-\4\1\0=\4\5\3B\1\2\1K\0\1\0\1¿\2¿\17capabilities\1\0\0\nsetup\rtsserver\24document_formatting\26resolved_capabilitiesﬁ\30\1\0\14\0Ã\1\0‚\0026\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\2B\2\1\0025\3\5\0006\4\6\0009\4\a\0049\4\b\4'\6\t\0'\a\n\0006\b\6\0009\b\v\b9\b\f\b9\b\r\b5\t\14\0B\4\5\0019\4\15\0019\4\16\0045\6\17\0=\2\18\6=\3\19\6B\4\2\0019\4\20\0019\4\16\0045\6\21\0=\2\18\6=\3\19\6B\4\2\0019\4\22\0019\4\16\0045\6\23\0=\2\18\6=\3\19\0065\a\24\0=\a\25\0065\a\26\0=\a\27\0065\a\29\0005\b\28\0=\b\30\a=\a\31\6B\4\2\0019\4 \0019\4\16\0045\6!\0=\2\18\6=\3\19\6B\4\2\0019\4\"\0019\4\16\0045\6#\0=\2\18\0065\a$\0=\a\25\6=\3\19\6B\4\2\0019\4%\0019\4\16\0045\6&\0=\2\18\0065\a'\0=\a\25\6=\3\19\6B\4\2\0019\4(\0019\4\16\0045\6)\0=\2\18\6=\3\19\0065\a*\0006\b\6\0009\b+\b9\b,\b'\n-\0B\b\2\2'\t.\0&\b\t\b>\b\2\a=\a\25\6B\4\2\0019\4/\0019\4\16\0045\0060\0=\2\18\6=\3\19\0065\a1\0=\a\25\6B\4\2\0019\0042\0019\4\16\0045\0063\0=\2\18\6=\3\19\0065\a4\0=\a\25\6B\4\2\0019\0045\0019\4\16\0045\0066\0=\2\18\6=\3\19\0065\a8\0004\b\3\0003\t7\0>\t\1\b=\b9\a=\a:\6B\4\2\0019\4;\0019\4\16\0045\6<\0=\2\18\6=\3\19\0065\a=\0=\a\25\0065\aO\0005\bC\0005\t>\0006\n\6\0009\n?\n6\f@\0009\fA\f'\rB\0B\n\3\2=\nA\t=\tD\b5\tF\0005\nE\0=\nG\t=\tH\b5\tL\0004\n\0\b6\v\6\0009\v+\v9\vI\v'\rJ\0B\v\2\2+\f\2\0<\f\v\n6\v\6\0009\v+\v9\vI\v'\rK\0B\v\2\2+\f\2\0<\f\v\n=\nM\t=\tN\b=\bP\a=\aQ\6B\4\2\0019\4R\0019\4\16\0045\6S\0=\2\18\6=\3\19\0065\aT\0=\a\25\0065\aU\0=\a\27\6B\4\2\0019\4V\0019\4\16\0045\6W\0=\2\18\6=\3\19\0063\aX\0=\aY\6B\4\2\0019\4Z\0019\4\16\0045\6[\0=\2\18\6=\3\19\0065\a\\\0=\a\25\0065\a]\0=\a\27\0065\a_\0005\b^\0=\b`\a5\ba\0005\tb\0=\tc\b=\bd\a5\be\0=\bf\a=\a\31\6B\4\2\0019\4g\0019\4\16\0045\6h\0=\2\18\6=\3\19\0065\ai\0=\a\25\0065\aj\0=\a\27\0065\ak\0005\bl\0=\bm\a=\a\31\6B\4\2\0019\4n\0019\4\16\0045\6o\0=\2\18\6=\3\19\0065\ap\0=\a\25\0065\aq\0=\a\27\0065\aß\0005\bs\0005\tr\0=\tt\b5\tu\0=\tv\b5\tw\0=\tx\b5\ty\0=\tz\b5\t{\0=\t|\b5\t}\0=\t~\b5\t\127\0=\tÄ\b5\tÅ\0=\tÇ\b5\tÉ\0=\tÑ\b5\tÖ\0=\tÜ\b5\tá\0=\tà\b5\tâ\0=\tä\b5\tã\0=\tå\b5\tç\0=\té\b5\tè\0=\tê\b5\të\0=\tí\b5\tì\0=\tî\b5\tï\0=\tñ\b5\tó\0=\tò\b5\tô\0=\tö\b5\tõ\0=\tú\b5\tù\0=\tû\b5\tü\0=\t†\b5\t°\0=\t¢\b5\t£\0=\t§\b5\t•\0=\t¶\b=\b®\a=\a\31\6B\4\2\0019\4©\0019\4\16\0045\6™\0=\2\18\6=\3\19\0065\a´\0=\a\25\0065\a¨\0=\a\27\0065\aÆ\0005\b≠\0=\bØ\a=\a\31\6B\4\2\0019\4∞\0005\6…\0005\a±\0005\b≥\0006\t\6\0009\t\v\t9\t\f\t9\t≤\t>\t\1\b=\b¥\a5\b∂\0006\t\6\0009\t\v\t9\t\f\t9\tµ\t>\t\1\b=\b∑\a5\b∏\0006\t\6\0009\t\v\t9\t\f\t9\t\r\t>\t\1\b=\bπ\a5\bª\0006\t\6\0009\t\v\t9\t\f\t9\t∫\t>\t\1\b=\bº\a5\bæ\0006\t\6\0009\t\v\t9\t\f\t9\tΩ\t>\t\1\b=\bø\a5\b¡\0006\t\6\0009\t\v\t9\t\f\t9\t¿\t>\t\1\b=\b¬\a5\bƒ\0006\t\6\0009\t\v\t9\t\f\t9\t√\t>\t\1\b=\b≈\a5\b«\0006\t\6\0009\t\v\t9\t\f\t9\t∆\t>\t\1\b=\b»\a=\a \0065\aÀ\0B\4\3\0012\0\0ÄK\0\1\0\1\0\1\vprefix\r<leader>\6l\1\0\0\6k\1\3\0\0\0\19Signature Help\19signature_help\6a\1\3\0\0\0\16Code Action\16code_action\6R\1\3\0\0\0\vRename\vrename\6r\1\3\0\0\0\15References\15references\6i\1\3\0\0\0\19Implementation\19implementation\6h\1\3\0\0\0\nHover\6D\1\3\0\0\0\16Declaration\16declaration\6d\1\3\0\0\0\15Definition\15definition\1\0\1\tname\bLSP\rregister\ranalysis\1\0\0\1\0\4\19diagnosticMode\14workspace\20autoSearchPaths\2\26autoImportCompletions\2\27useLibraryCodeForTypes\2\1\2\0\0\vpython\1\3\0\0\23pyright-langserver\f--stdio\1\0\0\fpyright\fplugins\1\0\0\27rope_workspace_symbols\1\0\1\fenabled\2\25rope_implementations\1\0\1\fenabled\2\26rope_document_symbols\1\0\1\fenabled\2\20rope_definition\1\0\1\fenabled\2\17rope_symbols\1\0\1\fenabled\2\24rope_signature_help\1\0\1\fenabled\2\20rope_references\1\0\1\fenabled\2\16rope_rename\1\0\1\fenabled\2\15rope_hover\1\0\1\fenabled\2\20rope_completion\1\0\1\fenabled\2\fpreload\1\0\1\fenabled\2\vmccabe\1\0\1\fenabled\2\vpylint\1\0\1\fenabled\2\rpyflakes\1\0\1\fenabled\2\15pydocstyle\1\0\1\fenabled\2\16pycodestyle\1\0\1\fenabled\2\27jedi_workspace_symbols\1\0\1\fenabled\2\16jedi_rename\1\0\1\fenabled\2\25jedi_implementations\1\0\1\fenabled\2\26jedi_document_symbols\1\0\1\fenabled\2\20jedi_definition\1\0\1\fenabled\2\17jedi_symbols\1\0\1\fenabled\2\24jedi_signature_help\1\0\1\fenabled\2\20jedi_references\1\0\1\fenabled\2\15jedi_hover\1\0\1\fenabled\2\20jedi_completion\1\0\0\1\0\1\fenabled\2\1\2\0\0\vpython\1\2\0\0\npylsp\1\0\0\npylsp\vformat\1\0\1\venable\2\1\0\3\rvalidate\2\15completion\2\nhover\2\1\2\0\0\tyaml\1\3\0\0\25yaml-language-server\f--stdio\1\0\0\vyamlls\fsuggest\1\0\2\19fromVimruntime\2\20fromRuntimepath\2\findexes\24projectRootPatterns\1\6\0\0\fruntime\tnvim\t.git\rautoload\vplugin\1\0\2\bgap\3d\ncount\3\3\15diagnostic\1\0\3\14iskeyword\25@,48-57,_,192-255,-#\16runtimepath\5\15vimruntime\5\1\0\1\venable\2\1\2\0\0\bvim\1\3\0\0\24vim-language-server\f--stdio\1\0\0\nvimls\14on_attach\0\1\0\0\rtsserver\1\4\0\0\bcss\tscss\tless\1\3\0\0\18stylelint-lsp\f--stdio\1\0\0\18stylelint_lsp\rsettings\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\vexpand\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\6;\tpath\fpackage\nsplit\1\0\1\fversion\vLuaJIT\1\2\0\0\24lua-language-server\1\0\0\16sumneko_lua\rcommands\vFormat\1\0\0\0\1\0\0\vjsonls\1\3\0\0 vscode-html-language-server\f--stdio\1\0\0\thtml\1\5\0\0\16graphql-lsp\vserver\a-m\vstream\1\0\0\fgraphql@/lspinstall/eslint/node_modules/.bin/eslint-language-server\tdata\fstdpath\afn\1\4\0\0\tnode\0\f--stdio\1\0\0\veslint\1\3\0\0\24dot-language-server\f--stdio\1\0\0\ndotls\1\3\0\0\22docker-langserver\f--stdio\1\0\0\rdockerls\1\0\0\18cssmodules_ls\17init_options\22embeddedLanguages\1\0\0\1\0\5\tless\2\tscss\2\bcss\2\15typescript\2\15javascript\2\14filetypes\1\4\0\0\bcss\tscss\tless\bcmd\1\3\0\0\23css-languageserver\f--stdio\1\0\0\ncssls\1\0\0\29cucumber_language_server\nflags\17capabilities\1\0\0\nsetup\vbashls\1\0\2\vsilent\2\fnoremap\2\nhover\bbuf\blsp\6K\6n\bset\vkeymap\bvim\1\0\1\26debounce_text_changes\3ñ\1\25default_capabilities\17cmp_nvim_lsp\14lspconfig\14which-key\frequire\0", "config", "cmp-nvim-lsp")

vim.cmd [[ packadd telescope.nvim ]]

-- Config for: telescope.nvim
try_loadstring("\27LJ\2\n3\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\vhidden\2\15find_filesâ\n\1\0\v\0L\0t6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\3\4\0005\5\a\0005\6\5\0004\a\0\0=\a\6\6=\6\b\0054\6\0\0=\6\t\0054\6\0\0=\6\n\5B\3\2\0013\3\v\0009\4\f\0025\6J\0005\a\r\0005\b\15\0009\t\14\1>\t\1\b=\b\16\a5\b\18\0009\t\17\1>\t\1\b=\b\19\a5\b\21\0009\t\20\1>\t\1\b=\b\22\a5\b\24\0009\t\23\1>\t\1\b=\b\25\a5\b\26\0005\t\28\0009\n\27\1>\n\1\t=\t\22\b5\t\30\0009\n\29\1>\n\1\t=\t\25\b5\t \0009\n\31\1>\n\1\t=\t!\b5\t#\0009\n\"\1>\n\1\t=\t$\b5\t&\0009\n%\1>\n\1\t=\t'\b=\b(\a5\b*\0009\t)\1>\t\1\b=\b+\a5\b-\0009\t,\1>\t\1\b=\b.\a5\b/\0>\3\1\b=\b0\a5\b2\0009\t1\1>\t\1\b=\b3\a5\b5\0009\t4\1>\t\1\b=\b6\a5\b7\0005\t9\0009\n8\1>\n\1\t=\t:\b5\t<\0009\n;\1>\n\1\t=\t!\b5\t>\0009\n=\1>\n\1\t=\t'\b5\t@\0009\n?\1>\n\1\t=\tA\b5\tC\0009\nB\1>\n\1\t=\t6\b5\tE\0009\nD\1>\n\1\t=\t$\b5\tG\0009\nF\1>\n\1\t=\tH\b=\bI\a=\a+\0065\aK\0B\4\3\0012\0\0ÄK\0\1\0\1\0\1\vprefix\r<leader>\1\0\0\6l\6w\1\3\0\0\0\22workspace symbols\26lsp_workspace_symbols\1\3\0\0\0\21document symbols\25lsp_document_symbols\1\3\0\0\0\15references\19lsp_references\6i\1\3\0\0\0\20implementations\24lsp_implementations\1\3\0\0\0\21type definitions\25lsp_type_definitions\1\3\0\0\0\16definitions\20lsp_definitions\6a\1\3\0\0\0\17code actions\21lsp_code_actions\1\0\1\tname\bLSP\6r\1\3\0\0\0\14registers\14registers\6q\1\3\0\0\0\rquickfix\rquickfix\6p\1\3\0\0\0\nfiles\6h\1\3\0\0\0\14help tags\14help_tags\6f\1\3\0\0\0\rin files\14live_grep\6g\6t\1\3\0\0\0\nstash\14git_stash\6s\1\3\0\0\0\vstatus\15git_status\6d\1\3\0\0\0\tdiff\17git_bcommits\1\3\0\0\0\fcommits\16git_commits\1\3\0\0\0\rbranches\17git_branches\1\0\1\tname\bGit\6c\1\3\0\0\0\rcommands\rcommands\6b\1\3\0\0\0\fbuffers\fbuffers\6/\1\3\0\0\0\14in buffer\30current_buffer_fuzzy_find\6C\1\3\0\0\0\20command history\20command_history\1\0\1\tname\tFind\rregister\0\15extensions\fpickers\rdefaults\1\0\0\rmappings\1\0\0\nsetup\14which-key\22telescope.builtin\14telescope\frequire\0", "config", "telescope.nvim")

time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
