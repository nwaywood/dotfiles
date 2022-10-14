-- general lvim settings
lvim.log.level = "warn"
lvim.format_on_save = {
	pattern = { "*.lua", "*.scala" },
}
lvim.colorscheme = "tokyonight"
lvim.leader = "space"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.bufferline.active = false
lvim.builtin.bufferline.options.always_show_bufferline = false
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true

local nvim_tree_config = require("nvim-tree.config")
local tree_cb = nvim_tree_config.nvim_tree_callback
-- helper function to strip filename from end of path
-- eg. /my/path/file.txt -> /my/path
local strip_filename_from_dir = function(path)
	-- split table on "/"
	local sep = "/"
	local res = {}
	for str in string.gmatch(path, "([^" .. sep .. "]+)") do
		table.insert(res, str)
	end
	-- check if last path section contains "."
	local last = res[#res]
	if string.find(last, "%.") then
		-- last section is a filename, so strip
		table.remove(res, #res)
	end

	-- the leading "/" gets dropped, need to add it back
	return "/" .. table.concat(res, "/")
end
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.git.untracked = "★"
lvim.builtin.nvimtree.setup.renderer.highlight_git = true
lvim.builtin.nvimtree.setup.renderer.group_empty = true
lvim.builtin.nvimtree.setup.view.width = 40
lvim.builtin.nvimtree.setup.view.mappings.list = {
	{ key = { "<tab>", "go" }, cb = tree_cb("preview") }, -- tab is default, want to add `go`
	{
		key = "gs",
		action = "search_dir_in_telescope",
		action_cb = function(node)
			local final_path = strip_filename_from_dir(node.absolute_path)
			require("telescope.builtin").live_grep({ search_dirs = { final_path } })
		end,
	},
}

lvim.builtin.breadcrumbs.active = true

local dashboard = require("alpha.themes.dashboard")
local dashboardTable = lvim.builtin.alpha.dashboard.section.buttons.val
table.insert(dashboardTable, 3, dashboard.button("e", lvim.icons.ui.Note .. "  Open Explorer", ":NvimTreeToggle<CR>"))

-- :TSInstallInfo to see all options
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
	"tsx",
}

lvim.builtin.treesitter.highlight.enable = true
