function! SetNvimBuffersAndFiles()
  Plug 'Industrial/vim-smartbd'
  Plug 'Industrial/vim-smartbw'

  Plug 'scrooloose/nerdtree'
    let g:NERDTreeAutoDeleteBuffer=1
    let g:NERDTreeCascadeOpenSingleChildDir=1
    let g:NERDTreeCascadeSingleChildDir=0
    let g:NERDTreeCaseSensitiveSort=1
    let g:NERDTreeShowFiles=1
    let g:NERDTreeShowHidden=1
    let g:NERDTreeMinimalUI=1
    map <leader>[ :NERDTreeToggle<cr>
    map <leader>{ :NERDTreeFind<cr>

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
  autocmd VimEnter * NERDTree | wincmd l

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
  vnoremap <silent> <leader>s :sort<cr>

  " complete brackets / pairs
  Plug 'Raimondi/delimitMate'

  " Linting hints in the gutter.
  Plug 'w0rp/ale'
    let g:ale_set_loclist = 0
    let g:ale_set_quickfix = 1
    let g:ale_open_list = 0
    let g:ale_keep_list_window_open = 0
    let g:ale_sign_column_always = 1
    let g:ale_sign_error = 'E'
    let g:ale_sign_info = 'I'
    let g:ale_sign_warning = 'W'
    let g:ale_linters = {
      \ 'javascript': [
      \   'flow',
      \   'prettier',
      \   'eslint',
      \ ],
      \ 'typescript': [
      \   'prettier',
      \   'tslint'
      \ ],
      \ 'typescriptreact': [
      \   'prettier',
      \   'tslint'
      \ ]
      \ }
    let g:ale_fix_on_save = 1
    let g:ale_fixers = {
      \ '*': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \ ],
      \ 'javascript': [
      \   'prettier',
      \   'eslint',
      \ ],
      \ 'typescript': [
      \   'prettier',
      \   'tslint'
      \ ],
      \ 'typescriptreact': [
      \   'prettier',
      \   'tslint'
      \ ]
      \ }

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " CocInstall coc-actions coc-css coc-cssmodules coc-eslint coc-git
    " coc-gist coc-graphql coc-highlight coc-html coc-json coc-prisma coc-sh
    " coc-snippets coc-svg coc-tsserver coc-vimlsp coc-yaml coc-python

    set updatetime=300
    set shortmess+=c
    set signcolumn=yes

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
    nnoremap <silent> K :call <SID>show_documentation()<cr>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

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
  " Plug 'elzr/vim-json'

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

  " Plug 'MaxMEllon/vim-jsx-pretty'

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

  "source ~/.fzf/plugin/fzf.vim
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
    map <c-f> :Ag<cr>
    map <c-p> :Files $PWD<cr>

  " keybind: gc
  Plug 'tomtom/tcomment_vim'

  vnoremap <silent> <C-/> :TComment

  " # Cut, Copy and Paste
  "Plug 'maxbrunsfeld/vim-yankstack'

  " Don't overwrite unnamed reg on paste
  " TODO: More explanation.
  xnoremap <silent> p p:if v:register == '"'<bar>
                    \   let @@=@0<bar>
                    \ endif<cr>
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
