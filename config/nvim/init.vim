" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

" colortheme
" Plug 'altercation/vim-colors-solarized'
" Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'

" utilities
Plug 'vimwiki/vimwiki', {'branch': 'dev'}
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
Plug 'tpope/vim-dispatch' " Async job runner, used by vim-fugitive
Plug 'liuchengxu/vim-which-key'
Plug 'voldikss/vim-floaterm' " Open terminal in a floating window
Plug 'junegunn/goyo.vim' " zen mode
" https://vi.stackexchange.com/a/13092
Plug 'djoshea/vim-autoread' " auto refresh buffers on file change
Plug 'tmux-plugins/vim-tmux-focus-events' " make Focus autocmds work in tmux

" Core utils
Plug 'jeffkreeftmeijer/vim-numbertoggle' " relative/absolute line number management
Plug 'szw/vim-maximizer' " toggle windows fullscreen
Plug 'google/vim-searchindex' " shows number of matches for search commands
Plug 'mhinz/vim-sayonara' " Alternative to :quit which works like modern editors
Plug 'sickill/vim-pasta' " Context aware pasting (e.g. current indentation)
Plug 'unblevable/quick-scope' " Improve usability of f,F,t,T
Plug 'tpope/vim-fugitive' " Git support
Plug 'maxbrunsfeld/vim-yankstack' " Turn default register into a stack, alt-p and alt-shift-p, :Yanks
Plug 'machakann/vim-highlightedyank' " Visually shows yank area

" Vim language enhancements
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-commentary' " Adds the operators 'gc' and '[count]gcc' to comment code
Plug 'tpope/vim-repeat' " adds support for the '.' command for vim-surround, vim-commentary and vim-unimpaired
Plug 'kana/vim-textobj-user' " Allows custom text objects
Plug 'kana/vim-textobj-entire' " Adds the text objects 'ie' and 'ae'
Plug 'kana/vim-textobj-line' " Adds the text objects 'il' and 'al'
Plug 'kana/vim-textobj-fold' " Adds the text objects 'iz' and 'az'

" " Language specific
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' } " markdown support, folds, :Toc, better syntax highlighting
Plug 'fatih/vim-go', { 'for': 'go' } " go support
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' } " better syntax highlighting and indenting for haskell
Plug 'elmcast/elm-vim', { 'for': 'elm' } " elm support
Plug 'reasonml-editor/vim-reason', { 'for': 'reason' } " reason support
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] } " JSX support
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'javascript', 'javascript.jsx'] } " CSS3 syntax support

call plug#end()

" }}}

" General Setting {{{

" set color themes (from .vim/colors)
" Change highlighting for search terms (onedark theme colors)
" https://github.com/junegunn/goyo.vim/issues/84#issuecomment-156299446
augroup onedark_color_mods
    autocmd!
    autocmd ColorScheme * hi Search guibg=#C683D6 guifg=#343642 ctermbg=5
    autocmd ColorScheme * hi IncSearch guibg=#C683D6 guifg=#343642 ctermbg=5
augroup END

syntax enable
" execute 'set background='.$BACKGROUND
set background=dark
colorscheme onedark

" From onedark readme
" For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
" Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

" mapleader
let g:mapleader = "\<Space>"

" following 3 lines make the mapleader key work better
" set notimeout " can't have notimeout for vim-which-key to work
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
" solarized color: show current line number as orange with relativenumber set
" hi CursorLineNr ctermfg=3 ctermbg=0

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
inoremap kj <esc>

" make Y have the same behavior as C and D
call yankstack#setup() " https://github.com/maxbrunsfeld/vim-yankstack#compatibility
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
nnoremap <silent> <leader>0e :e ~/.config/nvim/init.vim<cr>
nnoremap <silent> <leader>0r :source ~/.config/nvim/init.vim<cr>

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

" Plugin settings {{{

" {{{ vim-highlightedyank
let g:highlightedyank_highlight_duration = 200
" }}}

" {{{ goyo
nnoremap <silent> <leader>z :Goyo<cr>
" }}}

" vim-floaterm {{{
nnoremap <silent> <leader>tg :FloatermNew lazygit<cr>
let g:floaterm_width=0.9
let g:floaterm_height=0.9
let g:floaterm_wintitle=0
" autoclose the terminal window when the terminal process terminates
let g:floaterm_autoclose=1
" make the border of floaterm windows purple
hi link FloatermBorder Operator
" }}}

" vim-markdown {{{

" Don't conceal backticks around code blocks in markdown
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_style_pythonic = 1

" Create fzf source for markdown symbols
" https://github.com/SidOfc/mkdx#open-toc-using-fzf-instead-of-quickfix-window
fun! s:MdGoToHeader(header)
    " given a line: '  84: # Header'
    " this will match the number 84 and move the cursor to the start of that line
    call cursor(str2nr(get(matchlist(a:header, ' *\([0-9]\+\)'), 1, '')), 1)
endfun

fun! s:MdFormatHeader(key, val)
    let text = get(a:val, 'text', '')
    let lnum = get(a:val, 'lnum', '')

    " if the text is empty or no lnum is present, return the empty string
    if (empty(text) || empty(lnum)) | return text | endif

    " We can't jump to it if we dont know the line number so that must be present in the outpt line.
    " We also add extra padding up to 4 digits, so I hope your markdown files don't grow beyond 99.9k lines ;)
    return repeat(' ', 4 - strlen(lnum)) . lnum . ': ' . text
endfun

fun! s:MdFzfHeaders()
    " Run :Toc whenever <leader>s is activated in markdown to
    " generate/regenerate the Toc location list contents
    " https://github.com/junegunn/fzf.vim/issues/94#issuecomment-197104238
    try
        :Toc
    catch /^Vim\%((\a\+)\)\=:E492/
        " No :Toc command
        return
    endtry
    " Close the Toc location list
    :lclose
    " passing 0 to getloclist(0) causes it to return the list instead of opening the quickfix list
    " this allows you to create a 'source' for fzf.
    " first we map each item (formatted for quickfix use) using the function MdFormatHeader()
    " then, we strip out any remaining empty headers.
    let headers = filter(map(getloclist(0), function('<SID>MdFormatHeader')), 'v:val != ""')

    " run the fzf function with the formatted data and as a 'sink' (action to execute on selected entry)
    " supply the MdGoToHeader() function which will parse the line, extract the line number and move the cursor to it.
    call fzf#run(fzf#wrap(
            \ {'source': headers, 'sink': function('<SID>MdGoToHeader') }
          \ ))
endfun

autocmd FileType markdown nnoremap <silent> <Leader>s :call <SID>MdFzfHeaders()<Cr>
" }}}

" quick-scope {{{

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" }}}

" vim-hexokinase {{{
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
let g:Hexokinase_optInPatterns = 'full_hex,triple_hex,rgb,rgba,hsl,hsla'
" }}}

" vimwiki {{{

" Disable table_mappings so autocompletion works https://github.com/vimwiki/vimwiki/issues/852
  let g:vimwiki_key_mappings =
    \ {
    \   'all_maps': 1,
    \   'global': 1,
    \   'headers': 1,
    \   'text_objs': 1,
    \   'table_format': 1,
    \   'table_mappings': 0,
    \   'lists': 1,
    \   'links': 1,
    \   'html': 1,
    \   'mouse': 1,
    \ }

" This line sets vimwiki files to be recognised as a markdown filetype
" as well as the vimwiki filetype
" This therefore enables my markdown plugin for vimwiki files
" NOTE: Need to be on the dev branch of vimwiki to support multi ft's
" https://github.com/vimwiki/vimwiki/issues/830#issuecomment-609326364
au FileType vimwiki set filetype=vimwiki.markdown

" Let vim-markdown plugin do the folding
let g:vimwiki_folding = 'custom'

" change the default global prefix to o for 'organiser'
let g:vimwiki_map_prefix = '<Leader>o'
" :lcd to vimwiki dir when wiki file is opened
let g:vimwiki_auto_chdir = 1
" change wiki path and set to markdown
" https://vimwiki.github.io/vimwikiwiki/Tips%20and%20Snips.html#Tips%20and%20Snips-FAQ-Markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" Only activate vimwiki bindings etc for markdown files within vimwiki dir
let g:vimwiki_global_ext = 0

" }}}

" lightline {{{

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

" }}}

" NERDTree {{{

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
" let g:WebDevIconsUnicodeDecorateFolderNodes = 0  "enables decorating folder nodes
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

" }}}

" Fugitive {{{

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
" }}}

" vim-go {{{

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
" }}}

" vim-marked {{{

nnoremap <leader>mo :MarkedOpen<cr>
nnoremap <leader>mq :MarkedQuit<cr>
" }}}

" vim-jsx {{{

let g:jsx_ext_required = 0
" }}}

" vim-maximizer {{{

nnoremap <C-w>z :MaximizerToggle<cr>
" }}}

" elm-vim {{{

let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 0 " disable built-in keybindings
let g:elm_detailed_complete = 1 " show types in autocompletion
" autocomplete only on attributes; doesn't seem to complete local vars
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.elm = '\.'
" }}}

" coc.nvim {{{

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

" }}}

" vim-surround {{{

" disable insert mode mappings <c-g>s and <c-g>S
let g:surround_no_insert_mappings=1
" }}}

" fzf.vim {{{

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
" https://github.com/junegunn/fzf/blob/master/README-VIM.md#explanation-of-gfzf_colors
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Statement'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'gutter':  ['bg', 'Normal'],
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
    nnoremap <silent> <leader>p :Projects<cr>
endif

" Dynamically show preview based on column width https://github.com/junegunn/fzf.vim/issues/1015
function! PreviewIfWide(spec)
  return &columns > 120 ? fzf#vim#with_preview(a:spec) : a:spec
endfunction

" Override default FzfFile command to be sexier https://github.com/junegunn/fzf.vim#example-customizing-files-command
" fnamemodify help: https://stackoverflow.com/questions/16485748/how-to-get-the-parent-directory-of-a-path-string
" NOTE: If I decide I want to show shorted full path from ~ instead of just
" the tail dir, use this https://github.com/junegunn/fzf.vim/blob/master/autoload/fzf/vim.vim#L310-L338
command! -bang -nargs=? -complete=dir FzfFiles
    \ call fzf#vim#files(<q-args>, PreviewIfWide({'options': ['--layout=reverse', '--info=inline', '--prompt=' . fnamemodify(<q-args>, ':t') . '/'], 'window': {'width': 0.9, 'height': 0.6, 'yoffset':0.5,'xoffset': 0.5, 'highlight': 'TODO', 'border': 'sharp'}}), <bang>0)

command! -bang -nargs=? -complete=dir FzfGFiles
    \ call fzf#vim#gitfiles(<q-args>, PreviewIfWide({'options': ['--layout=reverse', '--info=inline'], 'window': {'width': 0.9, 'height': 0.6, 'yoffset':0.5,'xoffset': 0.5, 'highlight': 'TODO', 'border': 'sharp'}}), <bang>0)

" If git repo, call GFiles, else call Files
function! FzfOmniFiles()
    " https://stackoverflow.com/questions/2180270/check-if-current-directory-is-a-git-repository
    silent! !git rev-parse --is-inside-work-tree
    if v:shell_error == 0
        " For options https://git-scm.com/docs/git-ls-files
        :FzfGFiles ?
    else
        :FzfFiles
    endif
endfunction

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
" https://github.com/junegunn/fzf.vim/issues/47
command! ProjectFiles execute 'FzfFiles' s:find_git_root()

nnoremap <silent> <leader>f :ProjectFiles<cr>
" nnoremap <silent> <leader>f  :call FzfOmniFiles()<cr>
nnoremap <silent> <leader>a  :RG<cr>
nnoremap <silent> <leader>l  :FzfBLines<cr>
nnoremap <silent> <leader>P  :FzfCommands<cr>
nnoremap <silent> <leader>ht  :FzfHelptags<cr>
nnoremap <silent> <leader>hm  :FzfMaps<cr>
" }}}

" vim-which-key {{{
set timeout
set timeoutlen=500
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" colors
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Constant
highlight default link WhichKeyDesc      Function

let g:which_key_use_floating_win = 0
" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Define prefix dictionary
let g:which_key_map =  {}
call which_key#register('<Space>', "g:which_key_map")

" Second level dictionaries:
" 'name' is a special field. It will define the name of the group, e.g., leader-f is the "+file" group.
" Unnamed groups will show a default empty string.
let g:which_key_map['f'] = 'search files'
let g:which_key_map['s'] = 'symbols'
let g:which_key_map['e'] = 'explorer'
let g:which_key_map['n'] = 'find in explorer'
let g:which_key_map['a'] = 'grep project'
let g:which_key_map['d'] = 'diagnostics'
let g:which_key_map['l'] = 'search lines'

let g:which_key_map['w'] = 'save file'
let g:which_key_map['q'] = 'quit buffer'
let g:which_key_map['Q'] = 'quit all'
let g:which_key_map['x'] = 'save and quit'

let g:which_key_map['p'] = 'projects'
let g:which_key_map['P'] = 'commands'
let g:which_key_map['/'] = 'toggle highlight'
" let g:which_key_map['0'] = 'edit init.vim'
let g:which_key_map['.'] = 'toggle numbers'
let g:which_key_map['z'] = 'zen mode'

" Don't show buffer switching in menu
let g:which_key_map['1'] = 'which_key_ignore'
let g:which_key_map['2'] = 'which_key_ignore'
let g:which_key_map['3'] = 'which_key_ignore'
let g:which_key_map['4'] = 'which_key_ignore'
let g:which_key_map['5'] = 'which_key_ignore'
let g:which_key_map['6'] = 'which_key_ignore'
let g:which_key_map['7'] = 'which_key_ignore'
let g:which_key_map['8'] = 'which_key_ignore'
let g:which_key_map['9'] = 'which_key_ignore'

let g:which_key_map['0'] = {
      \ 'name': '+config',
      \ 'e': 'edit init.vim',
      \ 'r': 'reload init.vim'
      \ }
let g:which_key_map.g = {
      \ 'name' : '+git',
      \ 's' : 'status',
      \ 'b' : 'blame',
      \ 'l' : 'log',
      \ 'd' : 'diff',
      \ 'w' : 'write',
      \ 'r' : 'read',
      \ 'p' : 'push'
      \ }

let g:which_key_map.b = {
      \ 'name' : '+buffers',
      \ 'c' : 'Create',
      \ 'l' : 'Last',
      \ 'n' : 'Next',
      \ 'p' : 'Previous',
      \ 'q' : 'Quit Buffer'
      \ }

let g:which_key_map.t = {
      \ 'name' : '+terminal',
      \ 'v' : 'vsplit',
      \ 'g' : 'git',
      \ }

let g:which_key_map.h = {
      \ 'name' : '+help',
      \ 't' : 'tags',
      \ 'm' : 'mappings',
      \ }

let g:which_key_map['m'] = { 'name' : '+marked' }
let g:which_key_map['m']['o'] = 'open'
let g:which_key_map['m']['o'] = 'quit'

let g:which_key_map['o'] = {
      \ 'name' : '+vimwiki',
      \ 'w' : 'Index file',
      \ 't' : 'Index file in tab',
      \ }

let g:which_key_map['o']['i'] = 'which_key_ignore'
let g:which_key_map['o']['s'] = 'which_key_ignore'

" }}}

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
    " https://github.com/junegunn/fzf.vim/issues/544#issuecomment-457456166
    au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    au FileType fzf tunmap <buffer> <Esc>

    " window navigation
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-l> <C-\><C-n><C-w>l
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k

    tnoremap <C-w>z <C-\><C-n>:MaximizerToggle<cr>i
endif

" vimr settings
" =============
if has('gui_vimr')
    " rerun the last run command https://github.com/kassio/neoterm/issues/81
    " nnoremap <silent> <leader>vl :<C-u>exec printf("%sTexec !! \<lt>CR>", v:count)<CR>
    " nnoremap <leader>vp :T<space>
endif

" }}}

" vim:foldmethod=marker
