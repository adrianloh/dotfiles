function! spacesNotTabs#TabToggle() abort
  if &expandtab
    set noexpandtab
  else
    set expandtab
  endif
endfunction

function! autoload#after() abort
  let g:rustfmt_autosave = 1
  let g:racer_cmd = "/home/ahriman/.cargo/bin/racer"
  let g:racer_experimental_completer = 1
  let g:racer_insert_paren = 1
  set expandtab
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4

  nmap <F12> :call spacesNotTabs#TabToggle()<CR>
endfunction
