-- core mappings
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { silent = true })
vim.api.nvim_set_keymap("n", "\\", '"_', { silent = true }) -- blackhole register shortcut
vim.api.nvim_set_keymap("n", "Y", "y$", { silent = true })
vim.api.nvim_set_keymap("n", "j", "gj", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<C-e>", "3<C-e>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<C-y>", "3<C-y>", { silent = true, noremap = true })
-- keep current search result in center of viewport
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<D-s>", ":w<cr>", { noremap = true, silent = true })

lvim.builtin.which_key.mappings.x = { "<cmd>x<cr>", "Save and Exit" }
lvim.builtin.which_key.mappings["."] = { "<cmd>set rnu!<cr>", "Toggle Numbers" }
lvim.builtin.which_key.mappings["/"] = { "<cmd>set hlsearch!<CR>", "No Highlight" }
lvim.builtin.which_key.mappings.h = nil
