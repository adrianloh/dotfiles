function TabToggle()
  if &expandtab
    set noexpandtab
  else
    set expandtab
  endif
endfunction

function! spacesNotTabs#after() abort
  nmap <F12> :call TabToggle()<CR>
endfunction
