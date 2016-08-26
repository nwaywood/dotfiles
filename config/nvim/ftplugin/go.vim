setlocal foldmethod=syntax " syntax based folding for *.go
setlocal nofoldenable " don't fold by default
setlocal foldnestmax=1 " deepest fold is 1 level

" golang specific bindings (pseudo 'major mode' <leader>m)
" NOTE: These bindings must be nmap and not nnoremap to work!
nmap <Leader>mgg <Plug>(go-def)
nmap <Leader>mgv <Plug>(go-def-vertical)
nmap <Leader>mgs <Plug>(go-def-split)
nmap <Leader>mgt <Plug>(go-def-tab)
nmap <Leader>md <Plug>(go-doc)
