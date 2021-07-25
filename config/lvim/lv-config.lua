-- vim settings
vim.opt.cursorline = false
vim.opt.wrap = true
vim.opt.timeoutlen = 200
vim.opt.cmdheight = 1
vim.opt.scrolloff = 0 -- let cursor go to top and bottom of viewport
vim.opt.foldenable = false -- don't fold by default
vim.opt.relativenumber = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- My non leader keymappings
vim.api.nvim_set_keymap("n", "\\", '"_', { silent = true }) -- blackhole register shortcut
vim.api.nvim_set_keymap("n", "Y", "y$", { silent = true })
vim.api.nvim_set_keymap("n", "<C-e>", "3<C-e>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<C-y>", "3<C-y>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "gh", ":lua vim.lsp.buf.hover()<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<S-k>", ":BufferNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-j>", ":BufferPrevious<CR>", { noremap = true, silent = true })

-- lvim settings
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "spacegray"
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.compe.autocomplete = true
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.lsp.diagnostics.virtual_text = false

-- keymappings
lvim.leader = "space"

-- telescope config
local status_ok, ts_actions = pcall(require, "telescope.actions")
if not status_ok then
	return
end
lvim.builtin.telescope.defaults.mappings = {
	i = {
		["<C-g>"] = ts_actions.close,
		["<esc>"] = ts_actions.close,
		["<C-j>"] = ts_actions.move_selection_next,
		["<C-k>"] = ts_actions.move_selection_previous,
	},
	n = {
		["<C-g>"] = ts_actions.close,
		["<esc>"] = ts_actions.close,
	},
}

lvim.plugins = {
    {"lunarvim/colorschemes"},
	{ "christoomey/vim-tmux-navigator" },
   {
        "ray-x/lsp_signature.nvim",
        config = function() require"lsp_signature".on_attach() end,
        event = "InsertEnter"
    },

	{
		"unblevable/quick-scope",
		config = function()
			vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
		end,
	}, -- Improve usability of f,F,t,T
	{
		"tpope/vim-surround",
		config = function()
			vim.g.surround_no_insert_mappings = true
		end,
	},
	{ "google/vim-searchindex" }, -- shows number of matches for search commands
	{ "tpope/vim-repeat" },
	{ "tpope/vim-unimpaired" },
	{ "kana/vim-textobj-user" }, -- Allows custom text objects
	{ "kana/vim-textobj-entire" }, -- Adds the text objects 'ie' and 'ae'
	{ "kana/vim-textobj-line" }, -- Adds the text objects 'il' and 'al'
	-- { "navarasu/onedark.nvim" },
	-- "christianchiarulli/nvcode-color-schemes.vim",
  -- better quickfix bqf is a must have!
}

-- TODO
-- gitlinker
-- leader s s for symbol search
-- nvim tree to show git status of files
-- telescope to have prompt at the top with sorting order fixed

-- CHANGE DEFAULT BINDINGS
-- gh to hover instead of K
-- J and K to switch buffers instead of H and L

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end


-- Additional Leader bindings for WhichKey
lvim.builtin.which_key.mappings.x = { "<cmd>x<cr>", "Save and Exit" }
lvim.builtin.which_key.mappings.a = { "<cmd>Telescope live_grep<cr>", "Grep Project" }
lvim.builtin.which_key.mappings.n = { "<cmd>NvimTreeFindFile<cr>", "Show In Explorer" }
lvim.builtin.which_key.mappings["."] = { "<cmd>set rnu!<cr>", "Toggle Numbers" }
lvim.builtin.which_key.mappings["/"] = { '<cmd>set hlsearch!<CR>', "No Highlight" }
lvim.builtin.which_key.mappings.h = nil
-- lvim.builtin.which_key.mappings.f = { "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,--iglob,!.git<CR>", "Find files" }
-- lvim.builtin.which_key.mappings.m = {
--     name = "+custoM telescope",
--     b = { "<cmd>Telescope buffers<cr>", "Search buffers' titles" },
--     d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Search diagnostics" },
--     f = { "<cmd>Telescope git_files<cr>", "Search diagnostics" },
--     h = { "<cmd>Telescope command_history<cr>", "Search command history" },
--     j = { "<cmd>Telescope jumplist<cr>", "Search jumplist" },
--     l = { "<cmd>Telescope lsp_document_symbols<cr>", "Search symbols" },
--     q = { "<cmd>Telescope quickfix<cr>", "Search Quickfix list" },
--     s = {
--       "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<cr>",
--       "Search string",
--     },
--     w = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", "Search this word" },
--     z = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search symbols" },
--   }
