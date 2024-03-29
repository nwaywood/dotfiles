-- general vim settings
-- vim.opt.cursorline = false
vim.opt.wrap = true
-- vim.opt.relativenumber = true
vim.opt.timeoutlen = 200
vim.opt.cmdheight = 1
vim.opt.scrolloff = 0 -- let cursor go to top and bottom of viewport
-- vim.opt.showtabline = 0 -- need this opt when disabling bufferline

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldmethod = "manual"
vim.opt.foldenable = true -- don't fold by default
vim.opt.foldlevel = 99 -- https://stackoverflow.com/a/5786588/2580566
vim.opt.foldlevelstart = 99

vim.opt_global.shortmess:append("c")
vim.o.guifont = "FiraMono Nerd Font Mono"
