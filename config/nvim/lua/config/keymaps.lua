-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("i", "jk", "<ESC>", opts)
keymap("n", "\\", "\"_", opts) -- blackhole register shortcut

keymap("n", "<space>j", "J", { desc = "Join lines", noremap = true})

local lazyterm = function() Util.terminal(nil, { cwd = Util.root() }) end
keymap("n", "<c-`>", lazyterm, { desc = "Terminal (root dir)" })
keymap("t", "<C-`>", "<cmd>close<cr>", { desc = "Hide Terminal" })

vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>fn")
