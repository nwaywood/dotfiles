-- Configuration
require('Navigator').setup()

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap -- local alias for set_keymap function

-- Keybindings
keymap("n", "<C-h>", "<cmd>NavigatorLeft<cr>", opts)
keymap("n", "<C-j>", "<cmd>NavigatorDown<cr>", opts)
keymap("n", "<C-k>", "<cmd>NavigatorUp<cr>", opts)
keymap("n", "<C-l>", "<cmd>NavigatorRight<cr>", opts)