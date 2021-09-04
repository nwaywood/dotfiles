-- vim settings
vim.opt.cursorline = false
vim.opt.wrap = true
vim.opt.timeoutlen = 200
vim.opt.cmdheight = 1
vim.opt.scrolloff = 0 -- let cursor go to top and bottom of viewport
vim.opt.relativenumber = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false -- don't fold by default
vim.opt.foldlevel = 99 -- https://stackoverflow.com/a/5786588/2580566

-- My non leader keymappings
vim.api.nvim_set_keymap("n", "\\", '"_', { silent = true }) -- blackhole register shortcut
vim.api.nvim_set_keymap("n", "Y", "y$", { silent = true })
vim.api.nvim_set_keymap("n", "j", "gj", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<C-e>", "3<C-e>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<C-y>", "3<C-y>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "gh", ":lua vim.lsp.buf.hover()<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<S-k>", ":BufferNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-j>", ":BufferPrevious<CR>", { noremap = true, silent = true })
-- keep current search result in center of viewport
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })
-- TODO: switch to this new style?
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- lvim settings
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "onedarker"
lvim.leader = "space"
lvim.lsp.diagnostics.virtual_text = false

-- builtin plugin settings
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.treesitter.ensure_installed = {
	"lua",
	"scala",
	"bash",
	"dockerfile",
	"html",
	"css",
	"java",
	"javascript",
	"json",
	"regex",
	"ruby",
	"toml",
	"yaml",
	"typescript",
} -- :TSInstallInfo to see all options
lvim.builtin.treesitter.highlight.enabled = true

-- telescope config
lvim.builtin.telescope.on_config_done = function()
  local actions = require "telescope.actions"
  -- for input mode
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
  lvim.builtin.telescope.defaults.mappings.i["<C-g>"] = actions.close
  lvim.builtin.telescope.defaults.mappings.i["<esc>"] = actions.close
  -- for normal mode
  lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.n["<C-g>"] = actions.close
  lvim.builtin.telescope.defaults.mappings.n["<esc>"] = actions.close
  lvim.builtin.telescope.defaults.prompt_prefix = "❯ "
  lvim.builtin.telescope.defaults.selection_caret = "> "
  lvim.builtin.telescope.defaults.layout_config.prompt_position = "top"
  lvim.builtin.telescope.defaults.sorting_strategy = "ascending"
  lvim.builtin.telescope.defaults.path_display.shorten = {} -- 20 -- don't truncate path names
  -- lvim.builtin.telescope.defaults.borderchars = {
  -- 	{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
  -- 	-- prompt = {'t', 'r', 'b', 'l', 'c', 'c', 'c', 'c' },
  -- prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
  -- results = { "─", "│", "─", "│", "│", "│", "┘", "└" },
  -- 	-- preview = {'', '', '', '', '', '', '', '' },
  -- }
  -- lvim.builtin.telescope.defaults.color_devicons = false
end

-- Additional Leader bindings for WhichKey
lvim.builtin.which_key.mappings.x = { "<cmd>x<cr>", "Save and Exit" }
lvim.builtin.which_key.mappings.a = { "<cmd>Telescope live_grep<cr>", "Grep Project" }
lvim.builtin.which_key.mappings.n = { "<cmd>NvimTreeFindFile<cr>", "Show In Explorer" }
lvim.builtin.which_key.mappings["."] = { "<cmd>set rnu!<cr>", "Toggle Numbers" }
lvim.builtin.which_key.mappings["/"] = { "<cmd>set hlsearch!<CR>", "No Highlight" }
lvim.builtin.which_key.mappings.h = nil
lvim.builtin.which_key.mappings.s.w = {
	"<cmd>lua require('telescope.builtin').grep_string()<cr>",
	"Search current word",
}
lvim.builtin.which_key.mappings.s.s = {
	"<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<cr>",
	"Search string",
}
lvim.builtin.which_key.mappings.s.l = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search file" }
lvim.builtin.which_key.mappings.s.b = nil
lvim.builtin.which_key.mappings.s.p = nil
-- gitlinker
lvim.builtin.which_key.mappings.g.y = {
	'<cmd>lua require"gitlinker".get_buf_range_url("n", {print_url= false, action_callback = require"gitlinker.actions".open_in_browser})<cr>',
	"Gitlinker",
}
lvim.builtin.which_key.vmappings.g = {
	':lua require"gitlinker".get_buf_range_url("v", {print_url= false, action_callback = require"gitlinker.actions".open_in_browser})<cr>',
	"Gitlinker",
}
-- lvim.builtin.which_key.mappings.f = { "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,--iglob,!.git<CR>", "Find files" }
-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

-- Additional Plugins
lvim.plugins = {
	-- https://github.com/rockerBOO/awesome-neovim
	-- better quickfix bqf is a must have!
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
	{ "christoomey/vim-tmux-navigator" },
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").on_attach()
		end,
		event = "InsertEnter",
	},
	{
		"ruifm/gitlinker.nvim",
		requires = "nvim-lua/plenary.nvim",
	},
	{
		"unblevable/quick-scope",
		config = function()
			vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
		end,
	}, -- Improve usability of f,F,t,T
	-- jeffkreeftmeijer/vim-numbertoggle -- to only show relativenumber when focused
	-- vim essentials
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
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
	{ "FileType", "markdown", "set nospell" },
}
