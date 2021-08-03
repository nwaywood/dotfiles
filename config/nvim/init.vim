call plug#begin('~/.config/nvim/plugged')

Plug 'joshdick/onedark.vim'

Plug 'scrooloose/nerdtree', { 'tag': '6.8.0' } " file explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator' " use ctrl-hjkl to navigate between tmux and vim panes
Plug 'voldikss/vim-floaterm' " Open terminal in a floating window

" Core utils
Plug 'jeffkreeftmeijer/vim-numbertoggle' " relative/absolute line number management
Plug 'google/vim-searchindex' " shows number of matches for search commands
Plug 'unblevable/quick-scope' " Improve usability of f,F,t,T
Plug 'machakann/vim-highlightedyank' " Visually shows yank area

" Vim language enhancements
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-commentary' " Adds the operators 'gc' and '[count]gcc' to comment code
" Plug 'nwaywood/vim-commentary', { 'branch': 'original' } " Adds the operators 'gc' and '[count]gcc' to comment code, my fork adds duplicate and comment commands
Plug 'tpope/vim-repeat' " adds support for the '.' command for vim-surround, vim-commentary and vim-unimpaired
Plug 'kana/vim-textobj-user' " Allows custom text objects
Plug 'kana/vim-textobj-entire' " Adds the text objects 'ie' and 'ae'
Plug 'kana/vim-textobj-line' " Adds the text objects 'il' and 'al'

call plug#end()

syntax enable
set background=dark
colorscheme onedark
if (has("termguicolors"))
    set termguicolors
endif

let g:mapleader = "\<Space>"

" smarter searching
set ignorecase " case insensitive searching
set smartcase " case sensitive if search term explicilty contains a captital
set incsearch " set incremental search, like modern browsers
set showmatch
set hlsearch " highlight search results
set magic " make searching use normal regex (grep)


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
set number relativenumber

" Keymappings
inoremap jk <esc>
nnoremap Y y$
nnoremap \ "_
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$
nnoremap <C-s> :split<cr>
nnoremap <C-v> :vsplit<cr>
noremap <silent> <leader>/ :set hlsearch! hlsearch?<cr>
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> <leader>x :x<cr>
nnoremap <silent> <leader>q :q<cr>
nnoremap <silent> <leader>. :call NumberToggle()<cr>
function! NumberToggle()
    if(&relativenumber == 1)
        set number
        set norelativenumber
    else
        set relativenumber
        set number
    endif
endfunc


" Plugins
let g:highlightedyank_highlight_duration = 200

nnoremap <silent> <leader>gg :FloatermNew lazygit<cr>
let g:floaterm_width=0.9
let g:floaterm_height=0.9
let g:floaterm_wintitle=0
" autoclose the terminal window when the terminal process terminates
let g:floaterm_autoclose=1
" make the border of floaterm windows purple
hi link FloatermBorder Operator

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

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
" Change the NERDTree window width (default=31)
let g:NERDTreeWinSize=40
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" change window split keys to match how I open splits everywhere else
let g:NERDTreeMapOpenSplit='s'
let g:NERDTreeMapOpenVSplit='v'

let g:surround_no_insert_mappings=1

" FZF
let g:fzf_command_prefix = 'Fzf'
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
