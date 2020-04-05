" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

" color/theme stuff
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'

" utilities
" Plug 'wikitopian/hardmode' " learning vim like a boss
Plug 'vimwiki/vimwiki' " Org-mode like thing for Vim
Plug 'kassio/neoterm' " Wrapper around :term
Plug 'scrooloose/nerdtree' " file explorer
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Aldlevine/nerdtree-git-plugin' " this fork is required to grey out gitignored files
Plug 'tpope/vim-vinegar' " netrw replacement
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sbdchd/neoformat' " general formatter like beautify
" Plug 'majutsushi/tagbar' " display file scope in side bar
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
" Plug 'radenling/vim-dispatch-neovim' " add neovim strategy to dispatch
Plug 'benmills/vimux' " quickly run commands in a tmux pane
Plug 'w0rp/ale' " Async linting engine
" Plug 'neomake/neomake' " Alternative async linting engine
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " auto code completion
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' } " Atom-narrow for vim
Plug 'mileszs/ack.vim' " grep replacement
Plug 'christoomey/vim-tmux-navigator' " use ctrl-hjkl to navigate between tmux and vim panes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive' " Git support
Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app - mapped to <leader>m
Plug 'ryanoasis/vim-devicons'
Plug 'jsfaint/gen_tags.vim' " automatic ctag generation
Plug 'jeffkreeftmeijer/vim-numbertoggle' " relative/absolute line number management
Plug 'szw/vim-maximizer' " toggle windows fullscreen
Plug 'google/vim-searchindex' " shows number of matches for search commands
Plug 'moll/vim-bbye' " make buffer deleting preserve window layout
Plug 'plytophogy/vim-diffchanges' " view the unsaved changes in the current buffer

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

Plug 'reasonml-editor/vim-reason', { 'for': 'reason' } " reason support

Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] } " JSX support
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
Plug 'styled-components/vim-styled-components', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx'] }

Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'javascript', 'javascript.jsx'] } " CSS3 syntax support

Plug 'mattn/emmet-vim'

call plug#end()

" }}}

" General Setting {{{

" set color themes (from .vim/colors)
syntax enable
" let base16colorspace=256 " Access colors present in 256 colorspace
" set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
" " e.g. base16-solarized
" execute "colorscheme ".$THEME
" set background=dark
execute 'set background='.$BACKGROUND
colorscheme solarized

if has('gui_vimr')
    " " e.g. base16-solarized-dark
    execute 'set background='.$BACKGROUND
    " execute "colorscheme ".$THEME
    colorscheme onedark
endif

set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

" mapleader
let g:mapleader = "\<Space>"

" following 3 lines make the mapleader key work better
set notimeout
set ttimeout
set ttimeoutlen=10

" Use vims old regex engine for faster syntax highlighting
" http://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
set regexpengine=1
" mininum number of lines to correctly apply syntax highlighting to
syntax sync minlines=256

" tab control
set smarttab " tab respects 'tabstop', 'shiftwidth and 'softtabstop
set tabstop=4 " set the tab width to 4 spaces
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth
set expandtab " when pressing tab, insert spaces instead

" folds
set foldmethod=indent " default folding based on indentation
set nofoldenable " don't fold by default
set foldlevel=99 " https://stackoverflow.com/a/5786588/2580566

" smarter searching
set ignorecase " case insensitive searching
set smartcase " case sensitive if search term explicilty contains a captital
set incsearch " set incremental search, like modern browsers
set showmatch
set hlsearch " highlight search results
set magic " make searching use normal regex (grep)

" Change the backgroud for search terms to orange
" https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
" http://stackoverflow.com/questions/7103173/vim-how-to-change-the-highlight-color-for-search-hits-and-quickfix-selection
" hi Search ctermbg=55

" Line number management
" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
" NOTE: Focus events don't work in inside tmux with neovim
set number relativenumber

" misc
set mouse+=a " lets mouse resize vim windows
if !has('nvim')
    set ttymouse=xterm2 " lets mouse resize vim windows
endif
set linebreak " don't linebreak midword http://vimcasts.org/episodes/soft-wrapping-text/
set noerrorbells "no beeps in vim
set hidden " This allows buffers to be hidden if you've modified a buffer
set noshowcmd   " hide annoying flashing of commands below status bar
set autoindent " keep the indentation on <enter>
set noswapfile   "don't use swapfile
set nobackup     "dont create annoying backup files
set encoding=utf-8 " set default encoding to UTF-8
scriptencoding utf-8
set clipboard=unnamed " for copy/paste with osx
" make default splits split below/right instead of above/left
set splitbelow
set splitright
set diffopt+=vertical " always use verical diffs
" show current line number as orange with relativenumber set
hi CursorLineNr ctermfg=3 ctermbg=0
" force vim to read *.md files as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" make read read *.raml files as yaml
autocmd BufNewFile,BufRead *.raml set filetype=yaml

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
nnoremap <C-s> :split<cr>
nnoremap <C-v> :vsplit<cr>

" edit ~/.config/nvim/init.vim
map <leader>0 :e ~/.config/nvim/init.vim<cr>

" insert empty line between brackets (hacky, need a better way to do this)
inoremap {<CR> {<CR>}<C-o>O

" toggle paste mode
" noremap <leader>p :set paste!<cr>

" clear search highlighting and clear any message already displayed
noremap <silent> <leader>/ :set hlsearch! hlsearch?<cr>

" buffer navigation
nnoremap <silent> <leader>bp :bprevious<cr> " move to the previous buffer
nnoremap <silent> <leader>bn :bnext<cr> " move to the next buffer
nnoremap <silent> <leader>bc :enew<cr> " Open a new empty buffer
nnoremap <silent> <M-w> :Bdelete<CR> " close current buffer and move to the previous one (i.e. close 'tab' in other editor terminology)
nnoremap <silent> <leader>bq :Bdelete<CR> " close current buffer and move to the previous one (i.e. close 'tab' in other editor terminology)
" nnoremap <silent> <leader>bq :bp <BAR> bd #<CR> " close current buffer and move to the previous one (i.e. close 'tab' in other editor terminology)
nnoremap <silent> <leader>bl <c-^> " toggle between current and previous buffer
" buffer list command/mapping is in CtrlP section

" quick save
nnoremap <silent> <leader>w :w<cr>
" quick save and quit
nnoremap <silent> <leader>x :x<cr>
" quick quit
nnoremap <silent> <leader>q :q<cr>

" toggle relative/absolute line numbers
nnoremap <silent> <leader>. :call NumberToggle()<cr>

" highlight word on double click
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>:CountWord<cr>

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

" https://stackoverflow.com/questions/3431184/highlight-all-occurrence-of-a-selected-word
fun! CountWordFunction()
    try
        let l:win_view = winsaveview()
        let l:old_query = getreg('/')
        let var = expand("<cword>")
        exec "%s/" . var . "//gn"
    finally
        call winrestview(l:win_view)
        call setreg('/', l:old_query)
    endtry
endfun
" Set a command "CountWord" and a mapping to count word
command! -nargs=0 CountWord :call CountWordFunction()

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

" Trim trailing whitespace
" https://vi.stackexchange.com/a/456
function! TrimTrailingWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfunc
" Add command to call this function
command! TrimTrailingWhitespace call TrimTrailingWhitespace()

" Toggle location list
function! ToggleLocationList()
    let buffer_count_before = s:BufferCount()
    " Location list can't be closed if there's cursor in it, so we need
    " to call lclose twice to move cursor to the main pane
    silent! lclose
    silent! lclose

    if s:BufferCount() == buffer_count_before
        execute "silent! lopen"
    endif
endfunc

function! s:BufferCount()
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunc
command! ToggleLocationList call ToggleLocationList()
nnoremap <silent> <leader>d :ToggleLocationList<cr>

" }}}

" Plugins settings {{{

" ocaml
" -----
" let g:opamshare = substitute(system('opam config var share'), '\n$', '', '''')
" merlin setup
" execute "set rtp+=" . g:opamshare . "/merlin/vim"
" ocp-indent setup
" execute "set rtp^=" . g:opamshare . "/ocp-indent/vim"

" vim-airline
" -----------
set laststatus=2 " plugin won't work without this line
set noshowmode " hide the default insert/command mode indicator
let g:airline_powerline_fonts=1 " enable vim-devicons icons in airline

set timeoutlen=20 "gets rid of the pause when leaving insert mode
" for the fonts to work in iTerm, install a patch font and set it in iTerm
" prefs https://github.com/ryanoasis/nerd-fonts
" The line below breaks vimr
" set guifont=Fura\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h14 " won't work in macvim without this line
let g:airline_theme='base16'
" remove the patched arrows
let g:airline_powerline_fonts=0
let g:airline_left_sep=''
let g:airline_right_sep=''

" tabline stuff
let g:airline#extensions#tabline#enabled = 1 " enable the list of buffers at the top of the screen
let g:webdevicons_enable_airline_tabline = 0 " disable vim-devicons in the tabline
let g:airline#extensions#tabline#show_close_button=1 " this doesn't work :(

" buffers to emulate tabs
" let g:airline#extensions#tabline#formatter = 'unique_tail' " show just the filename in the buffer list
" let g:airline#extensions#tabline#fnamemod = ':t' " show just the filename in the buffer list
let g:airline#extensions#tabline#buffer_idx_mode = 1 " show index on buffer tabs
" leader-num to jump to corresponding buffer
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" ALE
" ---
"  cosmetics
" let g:airline#extensions#neomake#enabled=1
" call neomake#configure#automake('w')
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always=1
let g:ale_sign_error='•'
let g:ale_sign_warning='•'

let g:ale_lint_delay=0
let g:ale_open_list='on_save'


" only run eslint linter for js files
let g:ale_linters = {'javascript': ['eslint']}

" Fixers
let g:ale_fix_on_save = 1
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['eslint']
" let g:ale_javascript_prettier_options = '--tab-width 4 --no-semi --parser flow'
" Don't show an error when no eslint config is found
let g:ale_javascript_eslint_suppress_missing_config = 1

" ALE colors for gui
hi ALEWarningSign gui=bold guifg=#D19A66
hi ALEErrorSign gui=bold guifg=#E06C75
" Change the color of warnings and errors in the gutter for term colors
hi ALEWarningSign ctermfg=3 ctermbg=0
hi ALEErrorSign ctermfg=1 ctermbg=0
" NOTE: Overriding SignColumn instead of using ALESignColumnWithoutErrors
" because it doesn't seem to work :/
hi SignColumn ctermfg=10 ctermbg=0 guifg=Yellow
" let g:ale_change_sign_column_color=1
" hi ALESignColumnWithoutErrors ctermfg=10 ctermbg=0 guifg=Yellow

" NERDTree
" --------
" http://www.cheatography.com/stepk/cheat-sheets/vim-nerdtree/

" don't close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let g:NERDTreeShowHidden=1
" change vims cwd when the NERDTree root changes (e.g. when changes bookmark)
let g:NERDTreeChDirMode=2
" Toggle NERDTree
nnoremap <silent> <leader>e :NERDTreeToggle<cr>
" Find current file in NERDTree
nnoremap <silent> <leader>n :NERDTreeFind<cr>
" Shortcut to bring up autocomplete of NERDTree bookmarks
cnoreabbrev b NERDTreeFromBookmark
" remove some files by extension
let g:NERDTreeIgnore = ['\.js.map$', '\.pyc$']
" Change the NERDTree window width (default=31)
let g:NERDTreeWinSize=40
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" remap C-j and C-k commands so it doesnt interfere with vim-tmux-navigator
" plugin
let g:NERDTreeMapJumpNextSibling='C-d'
let g:NERDTreeMapJumpPrevSibling='C-u'
" change window split keys to match ctrlp mappings
let g:NERDTreeMapOpenSplit='s'
let g:NERDTreeMapOpenVSplit='v'
" don't override netrw (this interferes with vim-vinegar)
let g:NERDTreeHijackNetrw=0
" nice alignment of vim-devicons
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
" Show gitignored status of files (option from nerdtree-git-plugin)
let g:NERDTreeShowIgnoredStatus = 1
" enable showing git status through coloring the text (Aldlevine fork)
let g:NERDTreeGitStatusNodeColorization=1
let g:NERDTreeGitStatusWithFlags = 1

" Change the default colors of git status highlighting to match Atom
hi link NERDTreeGitStatusIgnored Comment
hi link NERDTreeGitStatusModified Type
hi link NERDTreeGitStatusDirDirty Type
hi NERDTreeGitStatusUntracked ctermfg=2 guifg=#98c379
" hi link NERDTreeGitStatusUntracked Operator

" Disable special highlighting of executable file
" https://github.com/scrooloose/nerdtree/blob/8cd17c1a478d8302e4782a95963abe46fc22c538/syntax/nerdtree.vim#L50
hi link NERDTreeExecFile Normal

" Ack
" ---
let g:ackprg='ag --vimgrep --smart-case'
cnoreabbrev ag Ack!
cnoreabbrev Ag Ack!

" diffchanges
" -----------
command DiffSaved DiffChangesDiffToggle " alias command to view unsaved changes in current buffer

" emmet-vim
" ---------
" only enable insert mode so C-Y doesn't clash with scrolling the viewport
let g:user_emmet_mode='i'

" gen_tags.vim
" ------------
" disable gtags support (I only need ctags)
let g:loaded_gentags#gtags = 1
" autogenerate ctags for scm repos to ~/.cache/tags_dir/<project-name>
let g:gen_tags#ctags_auto_gen = 1

" mappings to open def where ever I want
nnoremap gd <C-]>
nnoremap gv :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap gs :sp <CR>:exec("tag ".expand("<cword>"))<CR>

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
" nnoremap <leader>d :Dispatch<cr> " mapping used for 'diagnostics'
" disable m mappings so it doesn't clash with NERDTree m to open menu
let g:nremap = {"m": ""}

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
" open git status in a new tab
nnoremap <silent> <leader>gs :Gtabedit :<cr>
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
" let g:go_auto_type_info=1
"  executes :GoFmt everytime a go file is saved, using "goimport" makes saving
"  files slow
let g:go_fmt_command='gofmt'
" disable mappings related to Tags (clashes with <C-t> to open terminal)
let g:go_def_mapping_enabled = 0

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
let g:go_metalinter_command='gometalinter --disable-all --enable=vet
            \ --enable=vetshadow --enable=golint --enable=ineffassign --enable=goconst --enable=gofmt'
" let g:go_metalinter_command="gometalinter --disable=vetshadow --disable=test
"		 \ --disable=testify --disable=errcheck --linter='vet:go tool vet -composites=false ./*.go:PATH:LINE:MESSAGE'"

" tagbar
" ------
" nnoremap <silent> <leader>tt :TagbarToggle<cr>
" Gotags config
" let g:tagbar_type_go = {
"             \ 'ctagstype' : 'go',
"             \ 'kinds'     : [
"             \ 'p:package',
"             \ 'i:imports:1',
"             \ 'c:constants',
"             \ 'v:variables',
"             \ 't:types',
"             \ 'n:interfaces',
"             \ 'w:fields',
"             \ 'e:embedded',
"             \ 'm:methods',
"             \ 'r:constructor',
"             \ 'f:functions'
"             \ ],
"             \ 'sro' : '.',
"             \ 'kind2scope' : {
"             \ 't' : 'ctype',
"             \ 'n' : 'ntype'
"             \ },
"             \ 'scope2kind' : {
"             \ 'ctype' : 't',
"             \ 'ntype' : 'n'
"             \ },
"             \ 'ctagsbin'  : 'gotags',
"             \ 'ctagsargs' : '-sort -silent'
"             \ }

" vim-marked
" -----------
nnoremap <leader>mo :MarkedOpen<cr>
nnoremap <leader>mq :MarkedQuit<cr>

" vim-jsx
" -------
let g:jsx_ext_required = 0

" vim-maximizer
" -------------
nnoremap <C-w>z :MaximizerToggle<cr>

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
" augroup unusedbindings
" 	autocmd!
" 	autocmd VimEnter * nunmap =p
" 	autocmd VimEnter * nunmap =P
" augroup END

" Denite.nvim
" ===========

nnoremap <leader>l :Denite line -auto-preview<cr>
nnoremap <leader>a :Denite grep -auto-preview<cr>
nnoremap <leader>s :Denite outline<cr>
nnoremap <leader>p :Denite menu:projects -default-action=cd<cr>
nnoremap <D-S-p> :Denite command -default-action=execute<cr>
" hack fix for terminal vim https://stackoverflow.com/questions/33060569/mapping-command-s-to-w-in-vim
nnoremap <F6> :Denite command -default-action=execute<cr>
" nnoremap <leader>c :Denite file_rec<cr>
" nnoremap <leader>c :Denite file_rec -reversed -winheight=10 -auto-resize<cr>

" highlight groups for matches
hi DeniteHighlightChar ctermfg=4 guifg=Cyan
hi DeniteHighlightRange ctermfg=12 ctermbg=8

" add custom menu for changing projects (cwd)
let s:menus = {}
let s:menus.projects = {
            \ 'description': 'projects'
            \ }

" read in projects.vim file if it exists
" https://stackoverflow.com/questions/19898542/how-to-concatenate-environmental-variables-in-a-vimrc-file
let g:projects_path = $DOTFILES.'/config/nvim/projects.vim'
if filereadable(g:projects_path)
    exec 'source ' . g:projects_path
endif

" if the projects.vim file did exist, set the project list
if exists("g:projects")
    let s:menus.projects.directory_candidates = g:projects
endif

call denite#custom#var('menu', 'menus', s:menus)

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

" neovim settings
" ===============
if has('nvim')
    " fix the cursor blinking in insert mode (doesn't work :( ) :help guicursor
    " set guicursor=i:ver25-blinkon10

    " https://github.com/neovim/neovim/wiki/FAQ - How can I use true colors in
    " the terminal?
    " set termguicolors

    " terminal mode
    " -------------------------

    " verical term split, just in case
    nnoremap <silent> <leader>tv :vsp term://$SHELL<cr>
    " nnoremap <silent> <leader>ts :10sp term://$SHELL<cr>

    augroup Term
        autocmd!
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

    tnoremap <C-w>z <C-\><C-n>:MaximizerToggle<cr>i

    " neoterm
    let g:neoterm_size='12'
    let g:neoterm_default_mod='belowright'
    nnoremap <silent> <C-t> :Ttoggle<cr>
    " toggle terminal from within terminal mode
    tnoremap <silent> <C-t> <C-\><C-n>:Ttoggle<cr>
endif

" vimr settings
" =============
if has('gui_vimr')
    " Fix the airline bar in vimr
    let g:airline_theme='onedark'
    let g:airline_powerline_fonts=0
    let g:airline_left_sep=''
    let g:airline_right_sep=''

    " rerun the last run command https://github.com/kassio/neoterm/issues/81
    nnoremap <silent> <leader>vl :<C-u>exec printf("%sTexec !! \<lt>CR>", v:count)<CR>
    nnoremap <leader>vp :T<space>
endif

" }}}


" vim:foldmethod=marker
