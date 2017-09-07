" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

" color/theme stuff
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'

" utilities
" Plug 'wikitopian/hardmode' " learning vim like a boss
Plug 'vimwiki/vimwiki' " Org-mode like thing for Vim
Plug 'scrooloose/nerdtree' " file explorer
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-vinegar' " netrw replacement
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar' " display file scope in side bar
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
" Plug 'radenling/vim-dispatch-neovim' " add neovim strategy to dispatch
Plug 'benmills/vimux' " quickly run commands in a tmux pane
Plug 'w0rp/ale' " Async linting engine
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " auto code completion
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' } " Atom-narrow for vim
Plug 'mileszs/ack.vim' " grep replacement
Plug 'christoomey/vim-tmux-navigator' " use ctrl-hjkl to navigate between tmux and vim panes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive' " Git support
Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app - mapped to <leader>m
Plug 'ryanoasis/vim-devicons'

" Vim language enhancements
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-commentary' " Adds the operators 'gc' and '[count]gcc' to comment code
Plug 'tpope/vim-repeat' " adds support for the '.' command for vim-surround, vim-commentary and vim-unimpaired
Plug 'kana/vim-textobj-user' " Allows custom text objects
Plug 'kana/vim-textobj-entire' " Adds the text objects 'ie' and 'ae'
Plug 'kana/vim-textobj-fold' " Adds the text objects 'iz' and 'az'
Plug 'kana/vim-textobj-line' " Adds the text objects 'il' and 'al'
Plug 'kana/vim-textobj-function' " Adds the text objects 'if' and 'af'
Plug 'thinca/vim-textobj-function-javascript' " Adds 'if' and 'af' for javascript
Plug 'sickill/vim-pasta' " Context aware pasting (e.g. current indentation)


" Language specific
Plug 'fatih/vim-go', { 'for': 'go' } " go support
Plug 'zchee/deoplete-go', { 'do': 'make'} " go autocompletion integration with deoplete

Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' } " better syntax highlighting and indenting for haskell
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' } " haskell autocompletion integration with deoplete

Plug 'elmcast/elm-vim', { 'for': 'elm' } " elm support

call plug#end()

" }}}

" General Setting {{{

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
" let base16colorspace=256 " Access colors present in 256 colorspace
" set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
" " e.g. base16-solarized
" execute "colorscheme ".$THEME
" set background=dark
execute "set background=".$BACKGROUND
colorscheme solarized
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
" Change the backgroud for search terms to orange
" https://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
" http://stackoverflow.com/questions/7103173/vim-how-to-change-the-highlight-color-for-search-hits-and-quickfix-selection
" hi Search ctermbg=55

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
set diffopt+=vertical " always use verical diffs
" force vim to read *.md files as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" make read read *.raml files as yaml
autocmd BufNewFile,BufRead *.raml set filetype=yaml

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

" quick save
nnoremap <leader>w :w<cr>
" quick save and quit
nnoremap <leader>x :x<cr>
" quick quit
nnoremap <leader>q :q<cr>
" quick force quit
nnoremap <leader>1 :q!<cr>

" disable arrow keys until I stopped being a noob
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

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

" }}}

" Plugins settings {{{

" vim-airline
" -----------
set laststatus=2 " plugin won't work without this line
set noshowmode " hide the default insert/command mode indicator
let g:airline_powerline_fonts=1
set timeoutlen=20 "gets rid of the pause when leaving insert mode
" for the fonts to work in iTerm, install a patch font and set it in iTerm
" prefs https://github.com/ryanoasis/nerd-fonts
" The line below breaks vimr
" set guifont=Fura\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h14 " won't work in macvim without this line
let g:airline_theme='base16'
" buffers to emulate tabs
" let g:airline#extensions#tabline#enabled = 1 " enable the list of buffers at the top of the screen
" let g:airline#extensions#tabline#fnamemod = ':t' " show just the filename in the buffer list
" remove the patched arrows
let g:airline_powerline_fonts=0
let g:airline_left_sep=''
let g:airline_right_sep=''

" ALE
" ---
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always=1
let g:ale_sign_error='•'
let g:ale_sign_warning='•'
" NOTE: Overriding SignColumn instead of using ALESignColumnWithoutErrors
" because it doesn't seem to work :/
hi SignColumn ctermfg=10 ctermbg=0 guifg=Yellow
" let g:ale_change_sign_column_color=1
" hi ALESignColumnWithoutErrors ctermfg=10 ctermbg=0 guifg=Yellow

let g:ale_lint_delay=10
" let g:ale_open_list='on_save'

" Fixers
let g:ale_fix_on_save = 1
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['eslint']
" let g:ale_javascript_prettier_options = '--tab-width 4 --no-semi --parser flow'

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
" don't override netrw (this interferes with vim-vinegar)
let NERDTreeHijackNetrw=0
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0

" Ack
" ---
let g:ackprg='ag --vimgrep --smart-case'
cnoreabbrev ag Ack!
cnoreabbrev Ag Ack!

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
"  http://vi.stackexchange.com/questions/4673/open-gstatus-in-new-tab
nnoremap <silent> <leader>gs :Gstatus<cr>
" Revert current file back to last checked in version - HEAD (:Git checkout %)
nnoremap <silent> <leader>gr :Gread<cr>
" Stage the current file to the index (:Git add %)
nnoremap <silent> <leader>gw :Gwrite<cr>
nnoremap <silent> <leader>ge :Gedit<cr>
nnoremap <silent> <leader>gc :Gcommit<cr>
nnoremap <silent> <leader>gb :Gblame<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>gl :Glog<cr>

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
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
" show type info for go code
let g:go_auto_type_info=1
"  executes :GoFmt everytime a go file is saved, using "goimport" makes saving
"  files slow
let g:go_fmt_command="gofmt"


" au FileType go nnoremap <Leader>gi :GoImports<cr>
" au FileType go nnoremap <Leader>gm :GoMetaLinter<cr>
" remove red highlighting
let g:go_highlight_trailing_whitespace_error = 0
" run go-metalinter and gofmt on save
let g:go_fmt_autosave = 1
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'vetshadow', 'ineffassign', 'goconst']
" gometalinter command when executed via :GoMetaLinter
" au FileType go autocmd BufWritePre * :GoMetaLinter
let g:go_metalinter_command="gometalinter --disable-all --enable=vet
			\ --enable=vetshadow --enable=golint --enable=ineffassign --enable=goconst --enable=gofmt"
" let g:go_metalinter_command="gometalinter --disable=vetshadow --disable=test
"		 \ --disable=testify --disable=errcheck --linter='vet:go tool vet -composites=false ./*.go:PATH:LINE:MESSAGE'"

" tagbar
" ------
nnoremap <silent> <leader>tt :TagbarToggle<cr>
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
nnoremap <leader>mo :MarkedOpen<cr>
nnoremap <leader>mq :MarkedQuit<cr>

" elm-vim
" -----------
let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 0 " disable built-in keybindings
let g:elm_detailed_complete = 1 " show types in autocompletion
" autocomplete only on attributes; doesn't seem to complete local vars
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.elm = '\.'

" vimwiki
" -------
" change the default global prefix to o for 'organiser'
let g:vimwiki_map_prefix = '<Leader>o'

" change wiki path
let g:vimwiki_list = [{'path': '/Users/nick/Google Drive/vimwiki'}]

" heading highlighting
let g:vimwiki_hl_headers = 1

" unbind tpope/vim-unimpaired bindings that interfere with vimwiki '='
" normal mode binding
" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
autocmd VimEnter * nunmap =p
autocmd VimEnter * nunmap =P

" Denite.nvim
" ===========

nnoremap <leader>l :Denite line<cr>
nnoremap <leader>s :Denite grep<cr>
" nnoremap <leader>c :Denite file_rec<cr>

" highlight groups for matches
hi DeniteHighlightChar ctermfg=4 guifg=Cyan
hi DeniteHighlightRange ctermfg=12 ctermbg=8

" change default options
call denite#custom#option('default', {
	      \ 'prompt': '>',
	      \ 'highlight_matched_char': 'DeniteHighlightChar',
	      \ 'highlight_matched_range': 'DeniteHighlightRange'
	      \ })

" set file_rec to use ag
call denite#custom#var('file_rec', 'command',
	\ ['ag', '-l', '--nocolor', '-g', ''])

" Change mappings.
call denite#custom#map(
		\ 'insert',
		\ '<C-j>',
		\ '<denite:move_to_next_line>',
		\ 'noremap'
		\)
call denite#custom#map(
		\ 'insert',
		\ '<C-k>',
		\ '<denite:move_to_previous_line>',
		\ 'noremap'
		\)
call denite#custom#map(
		\ 'insert',
		\ '<C-g>',
		\ '<denite:quit>',
		\ 'noremap'
		\)
call denite#custom#map(
		\ 'insert',
		\ '<C-v>',
		\ '<denite:do_action:vsplit>',
		\ 'noremap'
		\)
call denite#custom#map(
		\ 'insert',
		\ '<C-s>',
		\ '<denite:do_action:split>',
		\ 'noremap'
		\)
call denite#custom#map(
		\ 'insert',
		\ '<C-p>',
		\ '<denite:do_action:preview>',
		\ 'noremap'
		\)
" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
		\ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" }}}

" GUI settings {{{

" Macvim settings
" ===============
" if (has("gui_running"))
" 	" http://vimdoc.sourceforge.net/htmldoc/options.html#'guioptions'
" 	set guioptions=egmt
" 	" don't use relative number because of a macvim bug
" 	set number
" 	set norelativenumber

" 	" start NERDTree automatically when vim starts up
" 	autocmd vimenter * NERDTree
" 	" focus the main window instead of NERDTree when vim starts up
" 	autocmd vimenter * wincmd p

" 	" colorscheme solarized
" 	" let g:airline_theme='solarized'
" endif


" neovim settings
" ===============
if has('nvim')
	" fix the cursor shape in insert mode
	:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
	" https://github.com/neovim/neovim/wiki/FAQ - How can I use true colors in
	" the terminal?
	" set termguicolors

	" splits
	nnoremap <silent> <leader>ts :10sp term://$SHELL<cr>i
	nnoremap <silent> <leader>tv :vsp term://$SHELL<cr>i

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

" vimr settings
" =============
if has("gui_vimr")
	" " e.g. base16-solarized-dark
	 execute "set background=".$BACKGROUND
	 " execute "colorscheme ".$THEME
	 colorscheme onedark

	" Fix the airline bar in vimr
	let g:airline_theme='onedark'
	let g:airline_powerline_fonts=0
	let g:airline_left_sep=''
	let g:airline_right_sep=''
endif

" Nyaovim settings
" ================
if exists('g:nyaovim_version')
	" " e.g. base16-solarized-dark
	 execute "set background=".$BACKGROUND
	 execute "colorscheme ".$THEME
	 "colorscheme onedark

	" Fix the airline bar in nyaovim
	let g:airline_theme='solarized'
	let g:airline_powerline_fonts=0
	let g:airline_left_sep=''
	let g:airline_right_sep=''
endif

" }}}


" vim:foldmethod=marker:foldlevel=0
