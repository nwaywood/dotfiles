local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("i", "jk", "<ESC>", { silent = true })
keymap("n", "<D-s>", ":w<cr>", { noremap = true, silent = true })

-- Resize with arrows
keymap("n", "<Up>", ":resize +2<CR>", opts)
keymap("n", "<Down>", ":resize -2<CR>", opts)
keymap("n", "<Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<Right>", ":vertical resize +2<CR>", opts)

-- faster window splitting
keymap("n", "<C-s>", ":split<CR>", opts)
keymap("n", "<C-v>", ":vsplit<CR>", opts)

-- navigate buffers
-- keymap("n", "<S-k>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
-- keymap("n", "<S-j>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
keymap("n", "<S-k>", ":bnext<CR>", opts)
keymap("n", "<S-j>", ":bprevious<CR>", opts)

-- make navigation of wrapped lines worked as you'd expect
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("n", "^", "g^", opts)
keymap("n", "$", "g$", opts)

-- faster viewport scrolling
keymap("n", "<C-e>", "3<C-e>", { silent = true, noremap = true })
keymap("n", "<C-y>", "3<C-y>", { silent = true, noremap = true })

keymap("n", "\\", '"_', { silent = true }) -- blackhole register shortcut
keymap("n", "Y", "y$", { silent = true })

-- keep current search result in center of viewport
keymap("n", "n", "nzzzv", { noremap = true, silent = true })
keymap("n", "N", "Nzzzv", { noremap = true, silent = true })

lvim.builtin.which_key.mappings.x = { "<cmd>x<cr>", "Save and Exit" }
lvim.builtin.which_key.mappings["."] = { "<cmd>set rnu!<cr>", "Toggle Numbers" }
lvim.builtin.which_key.mappings["/"] = { "<cmd>set hlsearch!<CR>", "Toggle Highlight" }

-- lvim.builtin.which_key.mappings.h = nil
lvim.builtin.which_key.mappings["h"] = {
	name = "+Help",
	h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
	H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
	M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
	k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
	c = { "<cmd>Telescope commands<cr>", "Commands" },
}

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

lvim.builtin.which_key.mappings.T = nil
lvim.builtin.which_key.mappings[";"] = nil
lvim.builtin.which_key.mappings.n = { "<cmd>NvimTreeFindFile<cr>", "Show In Explorer" }
lvim.builtin.which_key.setup.plugins.presets.z = true
lvim.builtin.which_key.setup.plugins.presets.g = true
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
