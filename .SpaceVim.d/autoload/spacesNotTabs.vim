function spacesNotTabs#TabToggle()
  if &expandtab
    set noexpandtab
  else
    set expandtab
  endif
endfunction

function! spacesNotTabs#after() abort
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
  set expandtab
  nmap <F12> :call spacesNotTabs#TabToggle()<CR>
endfunction
