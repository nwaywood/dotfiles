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
