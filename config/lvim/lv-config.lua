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
vim.api.nvim_set_keymap("n", "j", "gj", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<C-e>", "3<C-e>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<C-y>", "3<C-y>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "gh", ":lua vim.lsp.buf.hover()<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<S-k>", ":BufferNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-j>", ":BufferPrevious<CR>", { noremap = true, silent = true })

-- lvim settings
lvim.leader = "space"
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "onedark"
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.compe.autocomplete = true
-- if you don't want all the parsers change this to a table of the ones you want
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
lvim.lsp.diagnostics.virtual_text = false
-- to setup scala with nvim-metals instead of default
-- lvim.lsp.override = "scala"

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
lvim.builtin.telescope.defaults.prompt_prefix = "❯ "
lvim.builtin.telescope.defaults.selection_caret = "> "
lvim.builtin.telescope.defaults.layout_config.prompt_position = "top"
lvim.builtin.telescope.defaults.sorting_strategy = "ascending"
lvim.builtin.telescope.defaults.path_display.shorten = 20 -- don't truncate path names
-- lvim.builtin.telescope.defaults.borderchars = {
-- 	{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
-- 	-- prompt = {'t', 'r', 'b', 'l', 'c', 'c', 'c', 'c' },
-- prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
-- results = { "─", "│", "─", "│", "│", "│", "┘", "└" },
-- 	-- preview = {'', '', '', '', '', '', '', '' },
-- }
-- lvim.builtin.telescope.defaults.color_devicons = false

lvim.plugins = {
	-- better quickfix bqf is a must have!
	-- { "lunarvim/colorschemes" },
	{ "ChristianChiarulli/nvcode-color-schemes.vim" },
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

-- Additional Leader bindings for WhichKey
lvim.builtin.which_key.mappings.x = { "<cmd>x<cr>", "Save and Exit" }
lvim.builtin.which_key.mappings.a = { "<cmd>Telescope live_grep<cr>", "Grep Project" }
lvim.builtin.which_key.mappings.n = { "<cmd>NvimTreeFindFile<cr>", "Show In Explorer" }
lvim.builtin.which_key.mappings["."] = { "<cmd>set rnu!<cr>", "Toggle Numbers" }
lvim.builtin.which_key.mappings["/"] = { "<cmd>set hlsearch!<CR>", "No Highlight" }
lvim.builtin.which_key.mappings.h = nil
lvim.builtin.which_key.mappings.s.w = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", "Search word" }
lvim.builtin.which_key.mappings.g.y = {
	'<cmd>lua require"gitlinker".get_buf_range_url("n", {print_url= false, action_callback = require"gitlinker.actions".open_in_browser})<cr>',
	"Gitlinker",
}
lvim.builtin.which_key.vmappings.g = {
	':lua require"gitlinker".get_buf_range_url("v", {print_url= false, action_callback = require"gitlinker.actions".open_in_browser})<cr>',
	"Gitlinker",
}

-- lvim.builtin.which_key.mappings.f = { "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,--iglob,!.git<CR>", "Find files" }
-- lvim.builtin.which_key.mappings.m = {
--     name = "+custoM telescope",
--     s = {
--       "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<cr>",
--       "Search string",
--     },
--     z = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search symbols" },
--   }

-- autocommands
lvim.autocommands.custom_groups = {
	{ "FileType", "markdown", "set nospell" },
}
