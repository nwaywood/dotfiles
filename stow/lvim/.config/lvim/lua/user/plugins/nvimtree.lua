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

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<tab>', api.node.open.preview, opts('Open Preview'))
  vim.keymap.set('n', 'go', api.node.open.preview, opts('Open Preview'))
  vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'gs', function()
    local node = api.tree.get_node_under_cursor()
    local final_path = strip_filename_from_dir(node.absolute_path)
    require("telescope.builtin").live_grep({ search_dirs = { final_path } })
  end, opts('search_dir_in_telescope'))
end

lvim.builtin.nvimtree.setup.on_attach = on_attach
