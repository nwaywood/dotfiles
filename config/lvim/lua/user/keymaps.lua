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

vim.api.nvim_set_keymap("n", "<S-k>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-j>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

lvim.builtin.which_key.mappings.x = { "<cmd>x<cr>", "Save and Exit" }
lvim.builtin.which_key.mappings["."] = { "<cmd>set rnu!<cr>", "Toggle Numbers" }
lvim.builtin.which_key.mappings["/"] = { "<cmd>set hlsearch!<CR>", "No Highlight" }
lvim.builtin.which_key.mappings.h = nil

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

lvim.builtin.which_key.mappings.a = { "<cmd>Telescope live_grep<cr>", "Grep Project" }
lvim.builtin.which_key.mappings.n = { "<cmd>NvimTreeFindFile<cr>", "Show In Explorer" }
-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }
