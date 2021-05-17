source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/nvim.vim
source $HOME/.config/nvim/vscode.vim

" Initialize
" load filetype plugins, indentation and turn syntax highlighting on
filetype plugin indent on
syntax on

" Set the map leader key
noremap <Space> <Nop>
let mapleader="\<Space>"
let maplocalleader=','

" Support for python plugins
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

" resync syntax
map <leader>sy :syntax sync fromstart<cr>

" open and reload init.vim
map <leader>v :edit ~/.config/nvim/init.vim<cr>
map <leader>V :bufdo :source ~/.config/nvim/init.vim<cr>:bufdo :filetype detect<cr>

" load vundle
call plug#begin()

call SetBackups()
call SetBuffersAndFiles()
call SetFindingSearchingReplacing()
call SetIndentation()
call SetMovement()

if exists('g:vscode')
  call SetVSCodeBuffersAndFiles()
  call SetVSCodeVisualInformation()
  call SetVSCodeFindingSearchAndReplacing()
else
  call SetNvimBuffersAndFiles()
  call SetNvimColorSchemes()
  call SetNvimCompletion()
  call SetNvimFileTypes()
  call SetNvimFindingSearchingReplacing()
  call SetNvimIndentation()
  call SetNvimMovement()
  call SetNvimTmuxSupport()
  call SetNvimVersionControl()
  call SetNvimVisualInformation()
endif

" Finalize
call plug#end()

if exists('g:vscode')
else
  call FinalizeNvimBuffersAndFiles()
  call FinalizeNvimColorSchemes()
endif
