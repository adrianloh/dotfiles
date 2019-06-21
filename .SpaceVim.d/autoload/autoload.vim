function spacesNotTabs#TabToggle()
  if &expandtab
    set noexpandtab
  else
    set expandtab
  endif
endfunction

function! spaceNotTabs#after() abort
  set expandtab
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  nmap <F12> :call spacesNotTabs#TabToggle()<CR>
endfunction
