-- Additional Plugins
lvim.plugins = {
	{ "christoomey/vim-tmux-navigator" },
	-- {
	-- 	"folke/trouble.nvim",
	-- 	cmd = "TroubleToggle",
	-- },
	{
		"scalameta/nvim-metals",
	},
	{
		"kevinhwang91/nvim-bqf",
		event = "BufRead",
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
	{ "tpope/vim-repeat" },
	{ "tpope/vim-unimpaired" },
	{ "kana/vim-textobj-user" }, -- Allows custom text objects
	{ "kana/vim-textobj-entire" }, -- Adds the text objects 'ie' and 'ae'
	{ "kana/vim-textobj-line" }, -- Adds the text objects 'il' and 'al'
}
