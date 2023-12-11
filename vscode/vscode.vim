" plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-repeat' " adds support for the '.' command for vim-surround, vim-commentary and vim-unimpaired

Plug 'kana/vim-textobj-user' " Allows custom text objects
Plug 'kana/vim-textobj-entire' " Adds the text objects 'ie' and 'ae'
Plug 'kana/vim-textobj-line' " Adds the text objects 'il' and 'al'

" TODO: Switch from leap to flash after vscode integration is migrated to lua
Plug 'ggandor/leap.nvim', { 'branch': 'main' }
Plug 'unblevable/quick-scope' " Improve usability of f,F,t,T
Plug 'machakann/vim-highlightedyank' " Visually shows yank area

call plug#end()

" mapleader
let g:mapleader = "\<Space>"

set clipboard=unnamed " for copy/paste with osx

set ignorecase " case insensitive searching
set smartcase " case sensitive if search term explicilty contains a captital

" vim-commentary binding for VSCode (from plugins readme)
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

nnoremap <silent> <leader>e :<C-u>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
nnoremap <silent> <leader>f :<C-u>call VSCodeNotify('workbench.action.quickOpen')<CR>
nnoremap <silent> <leader>a :<C-u>call VSCodeNotify('workbench.view.search')<CR>
" nnoremap <silent> <leader>d :<C-u>call VSCodeNotify('workbench.actions.view.problems')<CR>
nnoremap <silent> <leader>d :<C-u>call VSCodeNotify('workbench.actions.view.toggleProblems')<CR>
" https://stackoverflow.com/questions/44932361/it-is-possible-to-filter-the-symbols-by-type
nnoremap <silent> <leader>s :<C-u>call VSCodeNotify('workbench.action.quickOpen', '@:')<CR>
nnoremap <silent> <leader>S :<C-u>call VSCodeNotify('workbench.action.showAllSymbols')<CR>
nnoremap <silent> <leader>t :<C-u>call VSCodeNotify('workbench.action.toggleActivityBarVisibility')<CR>
nnoremap <silent> <leader>gs :<C-u>call VSCodeNotify('gitlens.showQuickRepoStatus')<CR>
nnoremap <silent> <leader>gb :<C-u>call VSCodeNotify('gitlens.toggleFileBlame')<CR>
nnoremap <silent> <leader>n :<C-u>call VSCodeNotify('workbench.files.action.focusFilesExplorer')<CR>
nnoremap <silent> <leader>. :<C-u>call VSCodeNotify('settings.cycle.relativeLineNumbers')<CR>


nmap <silent> gv :<C-u>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>
nmap <silent> gr :<C-u>call VSCodeNotify('references-view.findReferences')<CR>
nmap <silent> gl :<C-u>call VSCodeNotify('editor.action.showHover')<CR>

" clear search highlighting and clear any message already displayed
noremap <silent> <leader>/ :set hlsearch! hlsearch?<cr>

nnoremap <silent> <leader>w :<C-u>call VSCodeNotify('workbench.action.files.save')<CR>
nnoremap <silent> <leader>q :<C-u>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>

" navigate between tabs
nnoremap <silent> K :<C-u>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>
nnoremap <silent> J :<C-u>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>

" Map J to gJ instead since I use J to navigate tabs
nnoremap <silent> gJ :<C-u>call VSCodeNotify('editor.action.joinLines')<CR>

" make Y have the same behavior as C and D
nnoremap Y y$

" blackhole register shortcut
nnoremap \ "_

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" will make navigation of wrapped lines worked as you'd expect
" In VSCode it seems they need to be nmap and and nnoremap
nmap <silent> j gj
nmap <silent> k gk
nmap <silent> ^ g^
nmap <silent> $ g$

nnoremap <silent> <C-w>o :<C-u>call <SID>closeOtherEditors()<CR>
function! s:closeOtherEditors()
    call VSCodeNotify('workbench.action.closeEditorsInOtherGroups')
    call VSCodeNotify('workbench.action.closeOtherEditors')
endfunction

" Plugin settings
" ===============
let g:highlightedyank_highlight_duration = 200

" Enable default leap keybindings
lua require('leap').add_default_mappings()

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#61afef' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#c678dd' gui=underline ctermfg=81 cterm=underline
