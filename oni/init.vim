" Plugins {{{
call plug#begin('~/.config/oni/plugged')

Plug 'kassio/neoterm' " Wrapper around :term

call plug#end()

" }}}

" General Setting {{{

" mapleader
let g:mapleader = "\<Space>"

" following 3 lines make the mapleader key work better
set notimeout
set ttimeout
set ttimeoutlen=10

" tab control
set smarttab " tab respects 'tabstop', 'shiftwidth and 'softtabstop
set tabstop=4 "set the tab width to 4 spaces
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth

" folds
set foldmethod=indent " default folding based on indentation
set nofoldenable " don't fold by default
set foldnestmax=1 " deepest fold is 1 level

" smarter searching
set ignorecase " case insensitive searching
set smartcase " case sensitive if search term explicilty contains a captital
set incsearch " set incremental search, like modern browsers
set showmatch
set hlsearch " highlight search results
set magic " make searching use normal regex (grep)

" Line number management
" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
set number relativenumber
" TODO: WinEnter and WinLeave adds line numbers to Denite, need to exclude
" Denite windows
" TODO: BufEnter and BufLeave adds line numbers to NERDTree
" autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
autocmd FocusGained,InsertLeave * set relativenumber
autocmd FocusLost,InsertEnter * set norelativenumber

" misc
set linebreak " don't linebreak midword http://vimcasts.org/episodes/soft-wrapping-text/
set noerrorbells "no beeps in vim
set hidden " This allows buffers to be hidden if you've modified a buffer
set showcmd   " show me what im typing
set nolist " hide invisible characters
set autoindent " keep the indentation on <enter>
set noswapfile   " don't use swapfile
set nobackup     " dont create annoying backup files
set encoding=utf-8 " set default encoding to UTF-8
scriptencoding utf-8
" set splitbelow
" set splitright
set diffopt+=vertical " always use verical diffs
" show current line number as orange with relativenumber set
hi CursorLineNr ctermfg=3 ctermbg=0
" force vim to read *.md files as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

augroup BufferCheck
	autocmd!
	autocmd  BufEnter * call CheckLeftBuffers()
augroup END

" }}}

" Keymappings {{{

" remap esc
inoremap jk <esc>

" make Y have the same behavior as C and D
nnoremap Y y$

" blackhole register shortcut
nnoremap \ "_

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" will make navigation of wrapped lines worked as you'd expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

" faster window splitting
nnoremap <silent> <C-s> :split<cr>
nnoremap <silent> <C-v> :vsplit<cr>

" buffer navigation
nnoremap <silent> <C-h> :wincmd h<cr>
nnoremap <silent> <C-j> :wincmd j<cr>
nnoremap <silent> <C-k> :wincmd k<cr>
nnoremap <silent> <C-l> :wincmd l<cr>

" insert empty line between brackets (hacky, need a better way to do this)
inoremap {<CR> {<CR>}<C-o>O

" clear search highlighting and clear any message already displayed
noremap <silent> <leader>/ :set hlsearch! hlsearch?<cr>

" buffer navigation
nnoremap <leader>bp :bprevious<cr> " move to the previous buffer
nnoremap <leader>bn :bnext<cr> " move to the next buffer
nnoremap <leader>bc :enew<cr> " Open a new empty buffer
nnoremap <leader>bq :bp <BAR> bd #<CR> " close current buffer and move to the previous one (i.e. close 'tab' in other editor terminology)
nnoremap <leader>bl <c-^> " toggle between current and previous buffer
" buffer list command/mapping is in CtrlP section

" quick save
nnoremap <leader>w :w<cr>
" quick save and quit
nnoremap <leader>x :x<cr>
" quick quit
nnoremap <leader>q :q<cr>
" quick force quit
nnoremap <leader>1 :q!<cr>

" toggle relative/absolute line numbers
nnoremap <leader>. :call NumberToggle()<cr>

" }}}

" Functions {{{

function! NumberToggle()
	if(&relativenumber == 1)
		set number
		set norelativenumber
	else
		set relativenumber
		set number
	endif
endfunc

" close Vim if the only buffers left in windows are NERDTree, help, loclist,
" quickfix or terminal
" https://yous.be/2014/11/30/automatically-quit-vim-if-actual-files-are-closed/
function! CheckLeftBuffers()
	if tabpagenr('$') == 1
		let l:i = 1
		while l:i <= winnr('$')
			if getbufvar(winbufnr(l:i), '&buftype') ==# 'help' ||
						\ getbufvar(winbufnr(l:i), '&buftype') ==# 'quickfix' ||
						\ getbufvar(winbufnr(l:i), '&buftype') ==# 'terminal' ||
						\ exists('t:NERDTreeBufName') &&
						\   bufname(winbufnr(l:i)) == t:NERDTreeBufName
				let l:i += 1
			else
				break
			endif
		endwhile
		if l:i == winnr('$') + 1
			qall
		endif
		unlet l:i
	endif
endfunction

" }}}

" Plugins settings {{{


" }}}

" GUI settings {{{

" onivim settings
" ===============

" fuzzy finder for onivim
nnoremap <leader>f :call OniCommand('quickOpen.show')<cr>
" toggle sidebar
nnoremap <leader>e :call OniCommand('sidebar.toggle')<cr>

" neovim settings
" ===============
if has('nvim')
	" terminal mode
	" -------------------------

	" verical term split, just in case
	nnoremap <silent> <leader>tv :vsp term://$SHELL<cr>
	" nnoremap <silent> <leader>ts :10sp term://$SHELL<cr>

	augroup Term
		autocmd!
		" never show line numbers in term buffers
		autocmd TermOpen * setlocal nonumber norelativenumber
		autocmd BufEnter term://* setlocal nonumber norelativenumber
		" Always start in terminal mode in term buffers
		autocmd TermOpen * startinsert
		autocmd BufEnter term://* startinsert
		autocmd BufLeave term://* stopinsert
	augroup END

	" escape from terminal mode to normal mode
	tnoremap <esc> <C-\><C-n>

	" window navigation
	tnoremap <C-h> <C-\><C-n><C-w>h
	tnoremap <C-j> <C-\><C-n><C-w>j
	tnoremap <C-k> <C-\><C-n><C-w>k
	tnoremap <C-l> <C-\><C-n><C-w>l

	" neoterm
	" let g:neoterm_size='12'
	nnoremap <silent> <C-t> :Ttoggle<cr>
	" toggle terminal from within terminal mode
	tnoremap <silent> <C-t> <C-\><C-n>:Ttoggle<cr>
endif

" }}}


" vim:foldmethod=marker:foldlevel=0
