function! SetBackups()
  " TODO: Document
  set backup

  " TODO: Document
  set writebackup

  " TODO: Document
  set noswapfile

  " TODO: Document
  set backupcopy=yes

  " TODO: Document
  set backupdir=~/.config/nvim/backup

  " TODO: Document
  set directory=~/.config/nvim/temp
endfunction

function! SetBuffersAndFiles()
  " make it possible to have buffers in the background
  set hidden

  " reload changes from disk
  set autoread
endfunction

function! SetFindingSearchingReplacing()
  " Highlight searches as you type.
  set hlsearch
  set incsearch

  " Global Copy/Paste Register Delete/Yank/Paste in Normal Mode.
  map <leader>d "+d
  map <leader>y "+y
  map <leader>p "+p

  " Mouse Copy/Paste Register Delete/Yank/Paste in Normal Mode.
  map <leader>D "*d
  map <leader>Y "*y
  map <leader>P "*p

  " Global Copy/Paste Register Delete/Yank/Paste in Visual Mode.
  vmap <c-v> "+p
  vmap <c-c> "+y
  vmap <c-x> "+d

  " Paste from Global Copy/Paste Register in Insert Mode.
  imap <c-v> <c-r>+

  " Save, Close, Quit
  map <c-s> :write<cr>
  imap <c-s> <esc>:write<cr>a
endfunction

function! SetIndentation()
  " TODO: Document.
  set autoindent

  " TODO: Document.
  set smarttab

  " TODO: Document.
  set expandtab

  " TODO: Document.
  set tabstop=2

  " TODO: Document.
  set softtabstop=2

  " TODO: Document.
  set shiftwidth=2
endfunction

function! SetMovement()
  " Set mouse mode to all
  set mouse=a

  " make movement keys wrap to the next/previous line
  set whichwrap=b,s,h,l,<,>,[,]

  " Fix backspace behaviour
  set backspace=indent,eol,start

  " don't wrap lines
  set nowrap
endfunction
