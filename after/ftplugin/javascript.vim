if !exists('g:vscode')
  let b:class_found = search('class ')
  if b:class_found
    call SetNvimClassFoldMode()
  else
    call SetNvimFunctionFoldMode()
  endif
endif
