call plug#begin('~/.config/nvim/plugged')

Plug 'joshdick/onedark.vim'

call plug#end()

syntax enable
set background=dark
colorscheme onedark
if (has("termguicolors"))
    set termguicolors
endif

