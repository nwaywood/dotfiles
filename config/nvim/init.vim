" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

" color/theme stuff
" Plug 'altercation/vim-colors-solarized'
" Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'

" utilities
Plug 'scrooloose/nerdtree' " file explorer
Plug 'Aldlevine/nerdtree-git-plugin' " this fork is required to grey out gitignored files
Plug 'ryanoasis/vim-devicons' " Add file icons to nerdtree, airline, ctrlp etc
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}} " language server protocol support
Plug 'antoinemadec/coc-fzf' " show coc lists in fzf.vim interface
Plug 'christoomey/vim-tmux-navigator' " use ctrl-hjkl to navigate between tmux and vim panes
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app - mapped to <leader>m
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " show colors of hex codes etc in editor

" Core utils
Plug 'jeffkreeftmeijer/vim-numbertoggle' " relative/absolute line number management
Plug 'szw/vim-maximizer' " toggle windows fullscreen
Plug 'google/vim-searchindex' " shows number of matches for search commands
Plug 'mhinz/vim-sayonara' " Alternative to :quit which works like modern editors
Plug 'sickill/vim-pasta' " Context aware pasting (e.g. current indentation)
Plug 'unblevable/quick-scope' " Improve usability of f,F,t,T
Plug 'tpope/vim-fugitive' " Git support
Plug 'tpope/vim-dispatch' " Async job runner, used by vim-fugitive

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

" Language specific
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' } " markdown support, folds, :Toc, better syntax highlighting
Plug 'fatih/vim-go', { 'for': 'go' } " go support
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' } " better syntax highlighting and indenting for haskell
Plug 'elmcast/elm-vim', { 'for': 'elm' } " elm support
Plug 'reasonml-editor/vim-reason', { 'for': 'reason' } " reason support
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] } " JSX support
" Plug 'styled-components/vim-styled-components', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'javascript', 'javascript.jsx'] } " CSS3 syntax support

call plug#end()

" }}}

" General Setting {{{

" set color themes (from .vim/colors)
syntax enable
execute 'set background='.$BACKGROUND
colorscheme onedark

" From onedark readme
" For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
" Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

if has('gui_vimr')
    execute 'set background='.$BACKGROUND
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
" set regexpengine=1

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

" Line number management
" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
" NOTE: Focus events don't work inside tmux with neovim
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
set nowritebackup
set encoding=utf-8 " set default encoding to UTF-8
scriptencoding utf-8
set clipboard=unnamed " for copy/paste with osx
" make default splits split below/right instead of above/left
set splitbelow
set splitright
set diffopt+=vertical " always use verical diffs
" show current line number as orange with relativenumber set
" hi CursorLineNr ctermfg=3 ctermbg=0
" Change highlighting for search terms (onedark theme colors)
hi Search guibg=#C683D6 guifg=#343642 ctermbg=5
hi IncSearch guibg=#C683D6 guifg=#343642 ctermbg=5
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
nnoremap <C-s> :split<cr>
nnoremap <C-v> :vsplit<cr>

" edit ~/.config/nvim/init.vim
map <leader>0 :e ~/.config/nvim/init.vim<cr>

" insert empty line between brackets (hacky, need a better way to do this)
inoremap {<CR> {<CR>}<C-o>O

" clear search highlighting and clear any message already displayed
noremap <silent> <leader>/ :set hlsearch! hlsearch?<cr>

" open tags whereever I want
" nnoremap gd <C-]>
" nnoremap gv :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" nnoremap gs :sp <CR>:exec("tag ".expand("<cword>"))<CR>

" buffer navigation
nnoremap <silent> <leader>bp :bprevious<cr> " move to the previous buffer
nnoremap <silent> J :bprevious<cr> " move to the previous buffer
nnoremap <silent> <leader>bn :bnext<cr> " move to the next buffer
nnoremap <silent> K :bnext<cr> " move to the next buffer
nnoremap <silent> <leader>bc :enew<cr> " Open a new empty buffer
nnoremap <silent> <M-w> :Sayonara!<CR> " close current buffer and move to the previous one (i.e. close 'tab' in other editor terminology)
nnoremap <silent> <leader>bq :Sayonara!<CR> " close current buffer and move to the previous one (i.e. close 'tab' in other editor terminology)
" nnoremap <silent> <leader>bq :bp <BAR> bd #<CR> " close current buffer and move to the previous one (i.e. close 'tab' in other editor terminology)
nnoremap <silent> <leader>bl <c-^> " toggle between current and previous buffer

" quick save
nnoremap <silent> <leader>w :w<cr>
" quick save and quit
nnoremap <silent> <leader>x :x<cr>
" quick quit
nnoremap <silent> <leader>q :Sayonara<cr>
nnoremap <silent> <leader>Q :qa<cr>
" nnoremap <silent> <leader>q :q<cr>

" toggle relative/absolute line numbers
nnoremap <silent> <leader>. :call NumberToggle()<cr>

" highlight word on double click

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

" Search for line in file that include the two search terms, in any order
function! SearchTwo(search1, search2)
    let query = '.*' . a:search1 . '\&.*' . a:search2
    :call search(query)
    " hack https://vi.stackexchange.com/questions/3655/how-can-i-make-a-search-in-vimscript-let-n-and-n-look-for-more
    let @/ = query
endfunc
command! -nargs=+ SearchTwo set hlsearch | call SearchTwo(<f-args>)

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

" Toggle location list (diagnostics)
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
" nnoremap <silent> <leader>d :ToggleLocationList<cr>

" }}}

" Plugins settings {{{

" quick-scope
" ===========

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" vim-hexokinase
" ==============
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
let g:Hexokinase_optInPatterns = 'full_hex,triple_hex,rgb,rgba,hsl,hsla'

" lightline
" =========
set laststatus=2 " plugin won't work without this line
set noshowmode " hide the default insert/command mode indicator
set showtabline=2
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['rtabs'] ]
      \ },
      \ 'tabline_subseparator' : {'left': '|', 'right': '' }, 
      \ 'tab': {
      \   'active': [ 'tabnum' ],
      \   'inactive': [ 'tabnum' ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \   'rtabs': 'LightlineTabRight',
      \   'cocerror': 'LightlineCocError',
      \   'cocwarn': 'LightlineCocWarn',
      \   'cocinfo': 'LightlineCocInfo'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel',
      \   'rtabs': 'tabsel',
      \   'cocerror': 'error',
      \   'cocwarn': 'warning',
      \   'cocinfo': 'tabsel'
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'cocerror', 'cocwarn', 'cocinfo' ],
      \             ['filename' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename'
      \ },
      \ 'component_raw': {
      \   'buffers': 1
      \ }
      \ }

let s:pallete = g:lightline#colorscheme#one#palette
" https://github.com/joshdick/onedark.vim/blob/master/autoload/lightline/colorscheme/onedark.vim#L51
" https://github.com/itchyny/lightline.vim/issues/355#issuecomment-470885228
let s:pallete.tabline.tabsel = [['#282C34', '#ABB2BF', 235, 145]]

" https://github.com/neoclide/coc.nvim/issues/401#issuecomment-622463326
function! s:lightline_coc_diagnostic(kind, sign) abort
    let info = get(b:, 'coc_diagnostic_info', 0)
    if empty(info) || get(info, a:kind, 0) == 0
      return ''
    endif
    return printf('%s %d', a:sign, info[a:kind])
endfunction
function! LightlineCocError() abort
    return s:lightline_coc_diagnostic('error', '•')
endfunction
function! LightlineCocWarn() abort
    return s:lightline_coc_diagnostic('warning', '•')
endfunction
" NOTE: Check out this if info doesn't look right https://github.com/josa42/vim-lightline-coc
function! LightlineCocInfo() abort
    return s:lightline_coc_diagnostic('information', '•')
endfunction
function! LightlineCocHint() abort
    return s:lightline_coc_diagnostic('hints', '•')
endfunction

autocmd User CocDiagnosticChange,CocStatusChange call lightline#update()

function! LightlineFilename()
  let filename = expand('%:f') !=# '' ? expand('%:f') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

" hack to show tabs in the right order
" https://github.com/itchyny/lightline.vim/issues/440
function! LightlineTabRight()
  return reverse(lightline#tabs())
endfunction

let g:lightline#bufferline#number_map = {
\ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}
let g:lightline#bufferline#unnamed='[NO NAME]'
let g:lightline#bufferline#clickable=1

" show ordinal numbers in buffers
let g:lightline#bufferline#show_number=2
" only show the tabline when there is at least two buffers
" Note: It will probably never happen, but a consequence of this is that the tabline
" won't show if you have multiple tabs but only one buffer
" let g:lightline#bufferline#min_buffer_count=2

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)

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
" change window split keys to match how I open splits everywhere else
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

" Fugitive
" --------
" open git status in a new tab
" https://github.com/tpope/vim-fugitive/issues/727
nnoremap <silent> <leader>gs :G<cr>
" Revert current file back to last checked in version - HEAD (:Git checkout %)
nnoremap <silent> <leader>gr :Gread<cr>
" Stage the current file to the index (:Git add %)
nnoremap <silent> <leader>gw :Gwrite<cr>
nnoremap <silent> <leader>gp :Git push<cr>
nnoremap <silent> <leader>gb :Git blame<cr>
nnoremap <silent> <leader>gd :Gdiffsplit<cr>
nnoremap <silent> <leader>gl :Gclog<cr>

augroup turbo_commit
  autocmd!
  autocmd BufEnter COMMIT_EDITMSG startinsert
augroup END

" vim-go
" ------
let g:go_gopls_enabled = 0
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

" coc.nvim
" ========
set signcolumn=yes
hi SignColumn ctermfg=10 ctermbg=0 guifg=Yellow

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gs :call CocAction('jumpDefinition', 'split')<cr>
nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<cr>
" NOTE: Need to map this to something else, gt goes to next tab
" nmap <silent> gt :call CocAction('jumpDefinition', 'tabe')<cr>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use gh to show documentation in preview window.
nnoremap <silent> gh :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

augroup mygroup
  autocmd!
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Coc mappings for fzf lists https://github.com/antoinemadec/coc-fzf
let g:coc_fzf_preview='up:50%:hidden'
let g:coc_fzf_opts=['--layout=reverse-list', '--info=inline']
" Show all diagnostics.
nnoremap <silent> <leader>d :CocFzfList diagnostics<cr>
" Find symbol of current document.
nnoremap <silent> <leader>s  :CocFzfList outline<cr>
" Search workspace symbols.
command! WorkspaceSymbols :CocFzfList symbols

" Golang https://github.com/golang/tools/blob/master/gopls/doc/settings.md for
" settings.json
" format go files on save
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" vim-surround
" ============
" disable insert mode mappings <c-g>s and <c-g>S
let g:surround_no_insert_mappings=1

" fzf.vim
" =======
let g:fzf_command_prefix = 'Fzf'
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Hide ugly fzf default statusline https://github.com/junegunn/fzf.vim#hide-statusline
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" map <c-j> and <c-k> to navigate through results in fzf filetype
autocmd FileType fzf tnoremap <buffer> <C-j> <Down>
autocmd FileType fzf tnoremap <buffer> <C-k> <Up>

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Statement'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" === FZF Commands and keybindings ===
" Available spec options here: https://github.com/junegunn/fzf/blob/master/README-VIM.md#fzfrun
" For what can go in the 'options' field of the spec: `man fzf`
" Note: --preview-window is the size of the preview within the fzf window, to
" change the size of the fzf window, use up,down,left,right e.g. 'down': '60%'

" Interactive Rg
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--preview-window', 'up:40%', '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>1)

" read in projects.txt file if it exists
" https://stackoverflow.com/questions/19898542/how-to-concatenate-environmental-variables-in-a-vimrc-file
let g:projects_path = $DOTFILES.'/config/nvim/projects.txt'
if filereadable(g:projects_path)
    " Change vim dir to project dir
    command! -nargs=* -complete=dir Projects call fzf#run(fzf#wrap(
      \ {'source': 'cat ~/.dotfiles/config/nvim/projects.txt',
      \  'sink': 'cd'}))
endif

" Dynamically show preview based on column width https://github.com/junegunn/fzf.vim/issues/1015
function! PreviewIfWide(spec)
  return &columns > 120 ? fzf#vim#with_preview(a:spec) : a:spec
endfunction

" Override default FzfFile command to be sexier https://github.com/junegunn/fzf.vim#example-customizing-files-command
command! -bang -nargs=? -complete=dir FzfFiles
    \ call fzf#vim#files(<q-args>, PreviewIfWide({'options': ['--layout=reverse', '--info=inline'], 'window': {'width': 0.9, 'height': 0.6, 'yoffset':0.5,'xoffset': 0.5, 'highlight': 'TODO', 'border': 'sharp'}})), <bang>0)

nnoremap <silent> <leader>f  :FzfFiles<cr>
nnoremap <silent> <leader>a  :RG<cr>
nnoremap <silent> <leader>l  :FzfBLines<cr>
nnoremap <silent> <leader>p  :FzfCommands<cr>
nnoremap <silent> <leader>h  :FzfHelptags<cr>

" }}}

" GUI settings {{{

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
