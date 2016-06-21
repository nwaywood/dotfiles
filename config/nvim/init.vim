call plug#begin('~/.config/nvim/plugged')

" color/theme stuff
" Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'

" utilities
" Plug 'wikitopian/hardmode' " learning vim like a boss
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar' " display file scope in side bar
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'benmills/vimux' " quickly run commands in a tmux pane
Plug 'Shougo/deoplete.nvim' " auto code completion
Plug 'mileszs/ack.vim' " grep replacement
Plug 'christoomey/vim-tmux-navigator' " use ctrl-hjkl to navigate between tmux and vim panes
" Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sickill/vim-pasta' " Context aware pasting (e.g. current indentation)
Plug 'tpope/vim-commentary' " Adds the operators 'gc' and '[count]gcc' to comment code
Plug 'kana/vim-textobj-user' " Allows custom text objects
Plug 'kana/vim-textobj-entire' " Adds the text objects 'ie' and 'ae'
Plug 'tpope/vim-fugitive' " Git support
Plug 'ryanoasis/vim-devicons'
Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app - mapped to <leader>m
Plug 'shougo/unite.vim' " generic fuzzy finder for lists (ie. amazing!)
Plug 'shougo/unite-outline' " show unite list of headings for the current buffer (function names, structs, variables etc)

" Language specific
Plug 'fatih/vim-go', { 'for': 'go' } " go support
Plug 'zchee/deoplete-go', { 'do': 'make'} " go autocompletion

call plug#end()

"""""""""""""""""
" General Setting
""""""""""""""""

" mapleader
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
set nocompatible " not compatible with vi
" following 3 lines make the mapleader key work better
set notimeout
set ttimeout
set ttimeoutlen=10

" set color themes (from .vim/colors)
syntax enable
let base16colorspace=256 " Access colors present in 256 colorspace
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
" e.g. base16-solarized
execute "set background=".$BACKGROUND
execute "colorscheme ".$THEME
" Use vims old regex engine for faster syntax highlighting
" http://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
set re=1
" mininum number of lines to correctly apply syntax highlighting to
syntax sync minlines=256

" tab control
set smarttab " tab respects 'tabstop', 'shiftwidth and 'softtabstop
set tabstop=4 "set the tab width to 4 spaces
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth
autocmd FileType haskell setlocal expandtab " Use spaces instead of tabs for haskell files

" smarter searching
set ignorecase " case insensitive searching
set smartcase " case sensitive if search term explicilty contains a captital
set incsearch " set incremental search, like modern browsers
set showmatch
set hlsearch " highlight search results
set magic " make searching use normal regex (grep)
" Change the backgroud for search terms
" https://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
" http://stackoverflow.com/questions/7103173/vim-how-to-change-the-highlight-color-for-search-hits-and-quickfix-selection
hi Search ctermbg=55  

" Line number management
" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
set number    "show line numbers
set relativenumber " set relative line numbers
autocmd InsertEnter * :set number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
autocmd InsertLeave * :set number

" misc
set mouse+=a " lets mouse resize vim windows
if !has('nvim')
	set ttymouse=xterm2 " lets mouse resize vim windows
endif
set noerrorbells "no beeps in vim
set hidden " This allows buffers to be hidden if you've modified a buffer
set showcmd   " show me what im typing
set autoindent " keep the indentation on <enter>
set noswapfile   "don't use swapfile
set nobackup     "dont create annoying backup files
set encoding=utf-8 " set default encoding to UTF-8
set clipboard=unnamed " for copy/paste with osx
" make default splits split below/right instead of above/left
set splitbelow
set splitright
" force vim to read *.md files as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" make read read *.raml files as yaml
autocmd BufNewFile,BufRead *.raml set filetype=yaml

"""""""""""""
" Keymappings
"""""""""""""

" remap esc
inoremap jk <esc>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" will make navigation of wrapped lines worked as you'd expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" faster window splitting
nnoremap <C-s> :split<cr>
nnoremap <C-v> :vsplit<cr>

" edit ~/.config/nvim/init.vim
map <leader>0 :e ~/.config/nvim/init.vim<cr>

" insert empty line between brackets (hacky, need a better way to do this)
inoremap {<CR> {<CR>}<C-o>O

" pretty print json on save
" TODO: Need to find a better way to validate json. This overwrites the json
" file with the errors if there are any
" au FileType json autocmd BufWritePre * :%!jq --indent 4 '.'

" toggle paste mode
noremap <leader>p :set paste!<cr>

" clear search highlighting and clear any message already displayed
noremap <silent> <leader>/ :set hlsearch! hlsearch?<cr>

" buffer navigation
nnoremap <leader>bh :bprevious<cr> " move to the previous buffer
nnoremap <leader>bl :bnext<cr> " move to the next buffer
nnoremap <leader>bc :enew<cr> " Open a new empty buffer
nnoremap <leader>bq :bp <BAR> bd #<CR> " close current buffer and move to the previous one (i.e. close 'tab')
nnoremap <leader>b. <c-^> " toggle between current and previous buffer
" buffer list command/mapping is in CtrlP section

nnoremap <leader>w :w<cr> " save
"nnoremap <leader>wq :wq<cr> " save and quit
nnoremap <leader>x :x<cr> " save and quit
nnoremap <leader>q :q<cr> " quit
nnoremap <leader>1 :q!<cr> " force quit

" disable arrow keys until I stopped being a noob
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" toggle relative/absolute line numbers
nnoremap <leader>. :call NumberToggle()<cr>

"""""""""""
" Functions
"""""""""""

function! NumberToggle()
  if(&relativenumber == 1)
    set number
	set norelativenumber
  else
    set relativenumber
	set number
  endif
endfunc


"""""""""
" Plugins
"""""""""

" vim-airline
" -----------
set laststatus=2 " plugin won't work without this line
set noshowmode " hide the default insert/command mode indicator
let g:airline_powerline_fonts=1
set timeoutlen=20 "gets rid of the pause when leaving insert mode
" for the fonts to work in iTerm, install a patch font and set it in iTerm
" prefs https://github.com/ryanoasis/nerd-fonts
set guifont=Fura\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h14 " won't work in macvim without this line
let g:airline_theme='base16'
" buffers to emulate tabs 
" let g:airline#extensions#tabline#enabled = 1 " enable the list of buffers at the top of the screen
" let g:airline#extensions#tabline#fnamemod = ':t' " show just the filename in the buffer list

" NERDTree
" --------
" http://www.cheatography.com/stepk/cheat-sheets/vim-nerdtree/

" don't close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" Toggle NERDTree
nnoremap <silent> <leader>e :NERDTreeToggle<cr>
" Find current file in NERDTree
nnoremap <silent> <leader>n :NERDTreeFind<cr>
" remove some files by extension
let NERDTreeIgnore = ['\.js.map$', '\.pyc$']
" Change the NERDTree window width (default=31)
let g:NERDTreeWinSize=40
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" remap C-j and C-k commands so it doesnt interfere with vim-tmux-navigator
" plugin
let NERDTreeMapJumpNextSibling='C-d'
let NERDTreeMapJumpPrevSibling='C-u'
" change window split keys to match ctrlp mappings
let NERDTreeMapOpenSplit='s'
let NERDTreeMapOpenVSplit='v'

" Ack
" ---
let g:ackprg='ag --vimgrep'

" CtrlP
" -----
nnoremap <silent> <leader>r :CtrlPMRU<cr>
nnoremap <silent> <leader>bb :CtrlPBuffer<cr>
let g:ctrlp_map='<leader>f'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'
" use ag for searching instead of vims globpath()
let g:ctrlp_user_command='ag %s -l --nocolor -g ""'

" vim-dispatch
" ------------
autocmd FileType go let b:dispatch='make build' " run a Go makefile by default on :Dispatch
nnoremap <leader>d :Dispatch<cr>

" Vimux
" -----
" Prompt for a command to run
noremap <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
noremap <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
noremap <Leader>vi :VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
noremap <Leader>vq :VimuxCloseRunner<CR>
" Zoom the runner pane (use <bind-key> z to restore runner pane)
noremap <Leader>vz :call VimuxZoomRunner()<CR>

" Fugitive 
" --------
nmap <silent> <leader>gs :Gstatus<cr>

" deoplete
" --------
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
set completeopt+=noselect
set completeopt-=preview " disable preview window at the bottom of the screen
inoremap <silent><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" vim-go
" ------
" more syntax highlighting for go code
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_build_constraints = 1
" show type info for go code
let g:go_auto_type_info=1
"  executes :GoFmt everytime a go file is saved, using "goimport" makes saving
"  files slow
let g:go_fmt_command="gofmt"
" golang specific bindings (pseudo 'go mode' <leader>g)
au FileType go nmap <Leader>gg <Plug>(go-def)
au FileType go nmap <Leader>gv <Plug>(go-def-vertical)
au FileType go nmap <Leader>gd <Plug>(go-doc)
" au FileType go nnoremap <Leader>gi :GoImports<cr>
" au FileType go nnoremap <Leader>gm :GoMetaLinter<cr>
let g:go_auto_type_info=0
" remove red highlighting
let g:go_highlight_trailing_whitespace_error = 0
" run go-metalinter on save
au FileType go autocmd BufWritePre * :GoMetaLinter
" gometalinter command
let g:go_metalinter_command="gometalinter --disable-all --enable=vet
			\ --enable=vetshadow --enable=golint --enable=ineffassign --enable=goconst --enable=gofmt" 
" let g:go_metalinter_command="gometalinter --disable=vetshadow --disable=test
"		 \ --disable=testify --disable=errcheck --linter='vet:go tool vet -composites=false ./*.go:PATH:LINE:MESSAGE'"

" tagbar
" ------
nnoremap <silent> <leader>t :TagbarToggle<cr>
" Gotags config
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" vim-marked
" -----------
nmap <leader>mo :MarkedOpen<cr>
nmap <leader>mq :MarkedQuit<cr>

" Unite.vim
" ---------
" Like ctrlp.vim settings.
call unite#custom#profile('default', 'context', {
\   'start_insert': 1,
\   'winheight': 10,
\   'direction': 'botright',
\ })
" fuzzy searching by default
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" unite_source_rec_async_command to use ag, do this apply to /neovim aswell?

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
	" Enable navigation with control-j and control-k in insert mode
	imap <buffer> <C-j> <Plug>(unite_select_next_line)
	imap <buffer> <C-k> <Plug>(unite_select_previous_line)
	" Runs 'split' or 'vsplit' action
	imap <silent><buffer><expr> <C-s> unite#do_action('split')
	imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
	" close window with C-g (same as ctrp and emacs)
endfunction

" mappings for unite lists
" nnoremap <leader>a :UniteWithProjectDir file_rec/neovim<cr>
nnoremap <leader>l :Unite bookmark<cr>
nnoremap <leader>bj :Unite outline<cr>

" Macvim settings
" ===============
if (has("gui_running"))
	" http://vimdoc.sourceforge.net/htmldoc/options.html#'guioptions'
	set guioptions=egmt
	" don't use relative number because of a macvim bug
	set number
	set norelativenumber

	" start NERDTree automatically when vim starts up
	autocmd vimenter * NERDTree
	" focus the main window instead of NERDTree when vim starts up
	autocmd vimenter * wincmd p

	" colorscheme solarized
	" let g:airline_theme='solarized'
endif

" Nyaovim settings
" ================
if exists('g:nyaovim_version')
	" Fix the airline bar in nyaovim
	let g:airline_theme='solarized'
	let g:airline_powerline_fonts=0
	let g:airline_left_sep=''
	let g:airline_right_sep=''
endif

" neovim settings
" ===============
if has('nvim')
	" fix the cursor shape in insert mode
	:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

	" terminal mode keybindings
	" -------------------------
	" escape from terminal mode to normal mode
	tnoremap jk <C-\><C-n>
	" window navigation
	tnoremap <C-h> <C-\><C-n><C-w>h
	tnoremap <C-j> <C-\><C-n><C-w>j
	tnoremap <C-k> <C-\><C-n><C-w>k
	tnoremap <C-l> <C-\><C-n><C-w>l
endif

" neovim-dot-app settings
" ===============
if exists("neovim_dot_app")
	" colorscheme=solarized
	" set background=dark
	" Fix the airline bar in gnvim
	let g:airline_theme='solarized'
	let g:airline_powerline_fonts=0
	let g:airline_left_sep=''
	let g:airline_right_sep=''
endif
