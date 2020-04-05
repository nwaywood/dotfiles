call plug#begin('~/.config/nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' } " Atom-narrow for vim

call plug#end()

syntax enable
set background=dark
colorscheme solarized

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
    inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    inoremap <silent><buffer><expr> <C-g>
                \ denite#do_map('quit')
endfunction

call denite#custom#option('default', {
            \ 'prompt': '>',
            \ 'start_filter': 1
            \ })
