local wk = require("which-key")

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap -- local alias for set_keymap function

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- leader mappings
wk.register({
  w = { ":w<cr>", "Save" },
  x = { ":x<cr>", "Save and Quit" },
  q = { ":x<cr>", "Quit" },
  ["/"] = { ":set hlsearch! hlsearch?<cr>", "Toggle Highlight" },
}, { prefix = "<leader>"})

-- Resize with arrows
keymap("n", "<Up>", ":resize +2<CR>", opts)
keymap("n", "<Down>", ":resize -2<CR>", opts)
keymap("n", "<Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<Right>", ":vertical resize +2<CR>", opts)

-- faster window splitting
keymap("n", "<C-s>", ":split<CR>", opts)
keymap("n", "<C-v>", ":vsplit<CR>", opts)

-- faster viewport scrolling
keymap("n", "<C-e>", "3<C-e>", opts)
keymap("n", "<C-y>", "3<C-y>", opts)

-- Navigate buffers
keymap("n", "<S-k>", ":bnext<CR>", opts)
keymap("n", "<S-j>", ":bprevious<CR>", opts)

-- make navigation of wrapped lines worked as you'd expect
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("n", "^", "g^", opts)
keymap("n", "$", "g$", opts)

keymap("n", "\\", "\"_", opts) -- blackhole register shortcut
-- TODO: number toggle <leader>. binding

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)