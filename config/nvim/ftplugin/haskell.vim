"use spaces instead of tabs in haskell files
setlocal expandtab

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
setlocal omnifunc=necoghc#omnifunc
