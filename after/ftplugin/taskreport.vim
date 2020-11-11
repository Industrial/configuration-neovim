nunmap <buffer> <tab>
nunmap <buffer> <S-tab>

" TODO: These don't seem to work.
nmap <buffer> <C-tab> :call taskwarrior#action#move_cursor('right', 'step')<cr>
nmap <buffer> <C-S-tab> :call taskwarrior#action#move_cursor('left', 'step')<cr>
