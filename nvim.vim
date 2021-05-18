function! SetNvimBuffersAndFiles()
  Plug 'Industrial/vim-smartbd'
  Plug 'Industrial/vim-smartbw'

  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Color the prompt like airline.
  " :PromptlineSnapshot! ~/.promptline.sh airline
  Plug 'edkolev/promptline.vim'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
    let g:airline_left_sep=''
    let g:airline_left_alt_sep=''
    let g:airline_right_sep=''
    let g:airline_right_alt_sep=''

    let g:airline_detect_modified=1
    let g:airline_detect_paste=1
    let g:airline_detect_iminsert=1
    let g:airline_inactive_collapse=1
    let g:airline_powerline_fonts=1

    if !exists('g:airline_symbols')
      let g:airline_symbols={}
    endif

    let g:airline#extensions#tagbar#enabled=0
    let g:airline#extensions#ale#enabled=1
    let g:airline#extensions#branch#enabled=1
    let g:airline#extensions#csv#enabled=1
    let g:airline#extensions#hunks#enabled=0
    let g:airline#extensions#syntastic#enabled=1
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#tabline#left_sep=' '
    let g:airline#extensions#tabline#left_alt_sep='|'
    let g:airline#extensions#tabline#formatter='unique_tail'
    let g:airline#extensions#whitespace#enabled=1
endfunction

function! FinalizeNvimBuffersAndFiles()
  " Open NERDTree and move the cursor to the right split, the file buffer.
  " autocmd VimEnter * NERDTree | wincmd l

  " Automatically reveal buffer in tree
  " autocmd BufEnter $PWD/*.* NERDTreeFind | wincmd l
endfunction

function! SetNvimColorSchemes()
  let g:base16colorspace=256

  Plug 'chriskempson/base16-vim'
endfunction

function! FinalizeNvimColorSchemes()
  source ~/.vimrc_background
endfunction

function! SetNvimCompletion()
  " Sorting
  " vnoremap <silent> <leader>s :sort<cr>

  " complete brackets / pairs
  Plug 'Raimondi/delimitMate'

  " " Linting hints in the gutter.
  " Plug 'w0rp/ale'
  "   let g:ale_set_loclist = 0
  "   let g:ale_set_quickfix = 1
  "   let g:ale_open_list = 0
  "   let g:ale_keep_list_window_open = 0
  "   let g:ale_sign_column_always = 1
  "   let g:ale_sign_error = 'E'
  "   let g:ale_sign_info = 'I'
  "   let g:ale_sign_warning = 'W'
  "   let g:ale_linters = {
  "     \ 'javascript': [
  "     \   'eslint'
  "     \ ],
  "     \ 'typescript': [
  "     \   'eslint'
  "     \ ],
  "     \ 'typescriptreact': [
  "     \   'eslint'
  "     \ ]
  "     \ }
  "   let g:ale_fix_on_save = 1
  "   let g:ale_fixers = {
  "     \ '*': [
  "     \   'remove_trailing_lines',
  "     \   'trim_whitespace',
  "     \ ],
  "     \ 'javascript': [
  "     \   'eslint'
  "     \ ],
  "     \ 'typescript': [
  "     \   'eslint'
  "     \ ],
  "     \ 'typescriptreact': [
  "     \   'eslint'
  "     \ ]
  "     \ }

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " TODO: This one needs a config file. Why?
    " coc-graphql

    " CocInstall coc-actions coc-css coc-cssmodules coc-eslint coc-highlight
    " coc-html coc-json coc-prisma coc-sh coc-snippets coc-svg coc-tsserver
    " coc-vimlsp coc-yaml coc-python

    set updatetime=300
    set shortmess+=c
    set signcolumn=auto:1-9

    " Use <c-space> to trigger completion.
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    " <cr> could be remapped by other vim plugin, try `:verbose imap <cr>`.
    if exists('*complete_info')
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<cr>"
    else
      inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
      inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
      inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
    endif

    " GoTo Code Navigation
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction
    nnoremap <silent> K :call <SID>show_documentation()<cr>

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " " TODO: Find exactly what this does.
    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder.
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end
endfunction

function! SetNvimFileTypes()
  " Many languages
  " Plug 'sheerun/vim-polyglot'

  " Git
  Plug 'tpope/vim-git'

  " HTML5
  Plug 'othree/html5.vim'

  " JavaScript
  Plug 'pangloss/vim-javascript'
    set conceallevel=1
    let g:javascript_plugin_jsdoc                      = 1
    let g:javascript_conceal_function                  = "ƒ"
    let g:javascript_conceal_null                      = "ø"
    let g:javascript_conceal_this                      = "@"
    let g:javascript_conceal_return                    = "⇚"
    let g:javascript_conceal_undefined                 = "¿"
    let g:javascript_conceal_NaN                       = "ℕ"
    let g:javascript_conceal_prototype                 = "¶"
    let g:javascript_conceal_static                    = "•"
    let g:javascript_conceal_super                     = "Ω"
    let g:javascript_conceal_arrow_function            = "⇒"
    let g:javascript_conceal_noarg_arrow_function      = "🞅"
    let g:javascript_conceal_underscore_arrow_function = "🞅"

    " and, &&     | ∧
    " or, ||      | ∨
    " not, !      | ¬
    " None        | ∅
    " true, false | ⊤, ⊥ (top and bottom from logic)
    " for         | ∀
    " in          | ∈
    " not in      | ∉

  " JSON
  Plug 'elzr/vim-json'
    " Don't hide quotes in JSON files.
    let g:vim_json_syntax_conceal=0

  " TypeScript
  Plug 'HerringtonDarkholme/yats'

  " JSX
  Plug 'maxmellon/vim-jsx-pretty'

  " GraphQL
  Plug 'jparise/vim-graphql'

  " Lua
  Plug 'tbastos/vim-lua'

  " MoonScript
  Plug 'leafo/moonscript-vim'

  " Fish
  Plug 'blankname/vim-fish'

  " Support ANSI Escape Characters in vim
  " Plug 'powerman/vim-plugin-AnsiEsc'

  " " Marko
  " Plug 'Epitrochoid/marko-vim-syntax'

  " Vim Wiki
  " Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
  "   let wiki_default = {}
  "   let wiki_default.syntax = 'markdown'
  "   let wiki_default.ext = '.md'
  "
  "   let g:vimwiki_list = [
  "     \ wiki_default ]
  "
  " let g:vimwiki_ext2syntax = {
  "     \ '.md': 'markdown',
  "     \ '.mkd': 'markdown' }
endfunction

function! SetNvimFindingSearchingReplacing()
  " Insert matching code automatically.
  Plug 'Spaceghost/vim-matchit'

  " Searching and replacing in files
  Plug 'dkprice/vim-easygrep'

  "source ~/.fzf/plugin/fzf.vim
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " keybind: gc
  Plug 'tomtom/tcomment_vim'
endfunction

function! SetNvimIndentation()
  Plug 'tpope/vim-sleuth'
endfunction

function! SetNvimMovement()
  " <leader><leader> + motion
  Plug 'Lokaltog/vim-easymotion'

  " switch buffers
  map <tab> :bn<cr>
  map <S-tab> :bp<cr>

  " move through splits
  nmap <C-h> <C-w>h
  nmap <C-j> <C-w>j
  nmap <C-k> <C-w>k
  nmap <C-l> <C-w>l

  " keep a certain number of lines visible (center the cursor, document moves
  " under it)
  set scrolloff=50


  " TODO: nvim only
  " improved buffer delete
  Plug 'Industrial/vim-smartbd'
  Plug 'Industrial/vim-smartbw'

  " nmap <leader>d :SmartBd<cr>
  nmap <leader>c :SmartBw<cr>
endfunction

function! SetNvimTmuxSupport()
  " Color the tmux line like airline
  " :TmuxlineSnapshot! ~/.tmuxline
  Plug 'edkolev/tmuxline.vim'
    let g:tmuxline_separators = {
          \ 'left' : '',
          \ 'left_alt': '',
          \ 'right' : '',
          \ 'right_alt' : '',
          \ 'space' : ' ' }

  " Vim inside tmux support
  Plug 'roxma/vim-tmux-clipboard'
endfunction

function! SetNvimVersionControl()
  " # Version Control
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'mhinz/vim-signify'

  Plug 'mattn/webapi-vim'
  Plug 'mattn/gist-vim'
    " If you want to detect filetype from the filename:
    let g:gist_detect_filetype=1
    " If you want your gist to be private by default:
    let g:gist_post_private=1
    " If you want to manipulate multiple files in a gist:
    let g:gist_get_multiplefile=1

  " Doesn't work with base16
  " Plug 'vim-scripts/vim-signify'
endfunction

function! SetNvimVisualInformation()
  " New home screen
  Plug 'mhinz/vim-startify'

  Plug 'junegunn/goyo.vim'

  Plug 'liuchengxu/vim-which-key'
    nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
    vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

    let g:which_key_sep = '→'
    let g:which_key_use_floating_win = 0

    let g:which_key_map =  {}
    let g:which_key_map['/'] = [":'<,'>TComment",                      'Comment']
    let g:which_key_map['d'] = [':call <SID>show_documentation()<cr>', 'Documentation']
    let g:which_key_map['S'] = [':Startify',                           'start screen']
    let g:which_key_map['z'] = [':Goyo',                               'zen']

    let g:which_key_map[' '] = {
      \ 'name': '+Easymotion ' ,
      \ 'f': ['<plug>(easymotion-prefix)f', 'find {char} to the right'],
      \ 'F': ['<plug>(easymotion-prefix)F', 'find {char} to the left'],
      \ 't': ['<plug>(easymotion-prefix)t', 'till before the {char} to the right'],
      \ 'T': ['<plug>(easymotion-prefix)T', 'till after the {char} to the left'],
      \ 'w': ['<plug>(easymotion-prefix)w', 'beginning of word forward'],
      \ 'W': ['<plug>(easymotion-prefix)W', 'beginning of WORD forward'],
      \ 'b': ['<plug>(easymotion-prefix)b', 'beginning of word backward'],
      \ 'B': ['<plug>(easymotion-prefix)B', 'beginning of WORD backward'],
      \ 'e': ['<plug>(easymotion-prefix)e', 'end of word forward'],
      \ 'E': ['<plug>(easymotion-prefix)E', 'end of WORD forward'],
      \ 'g': {
        \ 'name': '+Backwards ',
        \ 'e': ['<plug>(easymotion-prefix)ge', 'end of word backward'],
        \ 'E': ['<plug>(easymotion-prefix)gE', 'end of WORD backward'],
        \ },
      \ 'j': ['<plug>(easymotion-prefix)j', 'line downward'],
      \ 'k': ['<plug>(easymotion-prefix)k', 'line upward'],
      \ 'n': ['<plug>(easymotion-prefix)n', 'jump to latest "/" or "?" forward'],
      \ 'N': ['<plug>(easymotion-prefix)N', 'jump to latest "/" or "?" backward.'],
      \ 's': ['<plug>(easymotion-prefix)s', 'find(search) {char} forward and backward.'],
      \ }

    let g:which_key_map.w = {
      \ 'name': '+Window ',
      \ 'w': ['<C-W>w',     'Other Window'],
      \ 'd': ['<C-W>c',     'Close Window'],
      \ 'h': ['<C-W>h',     'Left'],
      \ 'H': ['<C-W>5>',    'Left (Resize)'],
      \ 'j': ['<C-W>j',     'Down'],
      \ 'J': [':resize +5', 'Down (Resize)'],
      \ 'k': ['<C-W>k',     'Up'],
      \ 'K': [':resize -5', 'Up (Resize)'],
      \ 'l': ['<C-W>l',     'Right'],
      \ 'L': ['<C-W>5<',    'Right (Resize)'],
      \ '=': ['<C-W>=',     'Balance'],
      \ 's': ['<C-W>s',     'Horizontal'],
      \ '-': ['<C-W>s',     'Horizontal'],
      \ 'v': ['<C-W>v',     'Vertical'],
      \ '|': ['<C-W>v',     'Vertical'],
      \ '?': [':Windows',   'Windows'],
      \ }

    let g:which_key_map.s = {
      \ 'name': '+Search ',
      \ '/': [':History/',  'History'],
      \ ';': [':Commands',  'Commands'],
      \ 'b': [':BLines',    'Buffer Find'],
      \ 'B': [':Buffers',   'Buffers'],
      \ 'c': [':Commits',   'Commits'],
      \ 'C': [':BCommits',  'Buffer Commits'],
      \ 'f': [':Ag',        'Find In Files'],
      \ 'F': [':Files',     'Find File'],
      \ 'g': [':GFiles',    'Git Files'],
      \ 'G': [':GFiles?',   'Git Files (Modified)'],
      \ 'h': [':History',   'File History'],
      \ 'H': [':History?',  'Command History'],
      \ 'l': [':Lines',     'Lines'],
      \ 'p': [':Helptags',  'Help Tags'],
      \ 's': [':Snippets',  'Snippets'],
      \ 'S': [':Colors',    'Colors'],
      \ 'y': [':Filetypes', 'File Types'],
      \ }

    let g:which_key_map.v = {
      \ 'name': '+FindReplace ',
      \ 'o': ['<Plug>EgMapGrepOptions', 'Options Buffer'],
      \ 'v': ['<Plug>EgMapGrepCurrentWord_v', 'Grep Word'],
      \ 'V': ['<Plug>EgMapGrepCurrentWord_V', 'Grep Whole Word'],
      \ 'a': ['<Plug>EgMapGrepCurrentWord_a', 'Grep Add Word'],
      \ 'A': ['<Plug>EgMapGrepCurrentWord_A', 'Grep Add Whole Word'],
      \ 'r': ['<Plug>EgMapGrepCurrentWord_r', 'Grep Replace Word'],
      \ 'R': ['<Plug>EgMapGrepCurrentWord_R', 'Grep Replace Whole Word'],
      \ 'y': {
        \ 'name': '+Options ',
        \ 'a': [':<SNR>70_ActivateAll()<cr>',                      'Activate All'],
        \ 'b': [':<SNR>70_ActivateBuffers()<cr>',                  'Activate Buffers'],
        \ 't': [':<SNR>70_ActivateTracked()<cr>',                  'Activate Tracked'],
        \ 'u': [':<SNR>70_ActivateUser()<cr>',                     'Activate User'],
        \ 'I': [':<SNR>70_SetFilesToInclude()<cr>',                'Set Files to Include'],
        \ 'x': [':<SNR>70_SetFilesToExclude()<cr>',                'Set Files to Exclude'],
        \ 'c': [':<SNR>70_ToggleCommand()<cr>',                    'Toggle Command'],
        \ 'r': [':<SNR>70_ToggleRecursion()<cr>',                  'Toggle Recursion'],
        \ 'd': [':<SNR>70_ToggleBufferDirectories()<cr>',          'Toggle Buffer Directories'],
        \ 'i': [':<SNR>70_ToggleIgnoreCase()<cr>',                 'Toggle Ignore Case'],
        \ 'h': [':<SNR>70_ToggleHidden()<cr>',                     'Toggle Hidden'],
        \ 'B': [':<SNR>70_Binary()<cr>',                           'Binary'],
        \ 'w': [':<SNR>70_Window()<cr>',                           'Window'],
        \ 'o': [':<SNR>70_OpenWindow()<cr>',                       'Open Window'],
        \ 'g': [':<SNR>70_EveryMatch()<cr>',                       'Every Match'],
        \ 'p': [':<SNR>70_JumpToMatch()<cr>',                      'Jump To Match'],
        \ '!': [':<SNR>70_WholeWord()<cr>',                        'Whole Word'],
        \ '~': [':<SNR>70_PatternType()<cr>',                      'Pattern Type'],
        \ 'e': [':<SNR>70_EchoFilesSearched()<cr>',                'Echo Files Searched'],
        \ 's': [':<SNR>70_Sort()<cr>',                             'Sort'],
        \ 'm': [':<SNR>70_ToggleReplaceWindowMode()<cr>',          'Toggle Replace Window Mode'],
        \ '?': [':<SNR>70_ToggleOptionsDisplay()<cr>',             'Toggle Options Display'],
        \ 'v': [':<SNR>70_EchoGrepCommand()<cr>',                  'Echo Grep Command'],
        \ '|': [':<SNR>70_EchoOptionsSet()<cr>',                   'Echo Options Set'],
        \ '*': [':<SNR>70_ToggleFileAssociationsInExplorer()<cr>', 'Toggle File Associations In Explorer'],
        \ },
      \ }

    " Register Which Key Map
    autocmd VimEnter * call which_key#register('<Space>', "g:which_key_map")

  " default is 1000
  set timeoutlen=100

  " Show the command being executed
  set showcmd

  " Show the mode you are in
  set showmode

  " No annoying things.
  set noerrorbells
  set novisualbell

  " No wildmenu.
  set wildmenu
  set wildmode=list:longest
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
  set wildignore+=*/node_modules/*

  " No "matchparen" plugin.
  let loaded_matchparen=1

  " gui options
  set guioptions=

  " show "invisible" characters
  set list
  "set listchars=tab:\|\ ,trail:-,extends:>,precedes:<,nbsp:%
  set listchars=tab:·\ ,trail:-,extends:>,precedes:<,nbsp:%

  " don't show chars on split and fold lines
  set fillchars=vert:\ ,fold:\ |" this comment prevents the escaped space from being removed.

  " turn on line numbers
  set number

  " highlight the line the cursor is on
  "set cursorline

  " Folds
  set foldenable
  set foldcolumn=1

  " Don't ignore anything (e.g. comments) when making folds
  set foldignore=

  " - Maps
    " Toggle fold mode
    nnoremap <leader>fc :call ToggleClassFoldMode()<cr>
    nnoremap <leader>ff :call ToggleFunctionFoldMode()<cr>
    nnoremap <leader>fm :call SetDefaultFoldMode()<cr>
endfunction

function! SetNvimDefaultFoldMode()
  " set the fold method to manual
  setlocal foldmethod=manual

  " Remove all folds made by the other fold method.
  normal zE<cr>

  " Set the fold level to 0.
  setlocal foldlevel=0

  " But open all folds at level 1 when opening the file
  setlocal foldlevelstart=-1

  " And do not allow folds below this level
  setlocal foldnestmax=20

  " Allow one line folds.
  setlocal foldminlines=1

  " turn on a fold column of 1
  " TODO: This does not apply correctly.
  setlocal foldcolumn=1
endfunction

function! SetNvimClassFoldMode()
  " setlocal the fold method to indent
  setlocal foldmethod=indent

  " Set the fold level to 0
  setlocal foldlevel=0

  " But open all folds at level 1 when opening the file
  setlocal foldlevelstart=1

  " And do not allow folds below this level
  setlocal foldnestmax=2

  " Allow one line folds.
  setlocal foldminlines=0

  " turn on a fold column of 3
  " TODO: This does not apply correctly.
  setlocal foldcolumn=3
endfunction

function! SetNvimFunctionFoldMode()
  " setlocal the fold method to indent
  setlocal foldmethod=indent

  " Set the fold level to 0
  setlocal foldlevel=0

  " Do not open any folds
  setlocal foldlevelstart=0

  " And do not allow folds below this level
  setlocal foldnestmax=1

  " Allow one line folds.
  setlocal foldminlines=0

  " turn on a fold column of 3
  " TODO: This does not apply correctly.
  setlocal foldcolumn=1
endfunction

function! ToggleNvimClassFoldMode()
  if &foldmethod=='indent'
    call SetDefaultFoldMode()
  else
    call SetClassFoldMode()
  endif
endfunction

function! ToggleNvimFunctionFoldMode()
  if &foldmethod=='indent'
    call SetDefaultFoldMode()
  else
    call SetFunctionFoldMode()
  endif
endfunction
