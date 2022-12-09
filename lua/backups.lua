return function(use)
  -- Make backups.
  vim.opt.backup = true
  
  -- Make a backup before overwriting a file.
  vim.opt.writebackup = true
  
  -- TODO: Document.
  vim.opt.swapfile = false
  
  -- TODO: Document.
  vim.opt.backupcopy = 'yes'
  
  -- TODO: Document.
  vim.opt.backupdir = 'backup'
  
  -- TODO: Document.
  vim.opt.directory = 'temp'
end
