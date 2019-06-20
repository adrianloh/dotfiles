function spacesNotTabs#TabToggle()
  if &expandtab
    set noexpandtab
  else
    set expandtab
  endif
endfunction

function! spaceNotTabs#after() abort
  set expandtab
  nmap <F12> :call spacesNotTabs#TabToggle()<CR>
endfunction
