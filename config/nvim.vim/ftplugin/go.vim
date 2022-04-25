setlocal foldmethod=syntax " syntax based folding for *.go
setlocal nofoldenable " don't fold by default
setlocal foldnestmax=1 " deepest fold is 1 level

" golang specific bindings (pseudo 'major mode' <leader>m)
" NOTE: These bindings must be nmap and not nnoremap to work!
" nmap gd <Plug>(go-def)
" nmap gv <Plug>(go-def-vertical)
" nmap gs <Plug>(go-def-split)
" nmap <Leader>mgt <Plug>(go-def-tab)
" nmap <Leader>md <Plug>(go-doc)

" let b:dispatch='make build' " run a Go makefile by default on :Dispatch
