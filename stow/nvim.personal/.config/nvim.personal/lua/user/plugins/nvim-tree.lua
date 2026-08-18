local wk = require("which-key")

-- keymaps
----------
wk.register({
	e = { ":NvimTreeToggle<cr>", "Toggle Explorer" },
	n = { ":NvimTreeFindFile<cr>", "Show in Explorer" },
}, {
	prefix = "<leader>",
})

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

require("nvim-tree").setup({
  on_attach = on_attach,
	disable_netrw = true, -- nvim-tree to override netrw
	view = {
		width = 40,
	},
	git = {
		ignore = false, -- display gitignored files
	},
	renderer = {
		group_empty = true, -- group empty dirs on one line like vscode
		highlight_git = true, -- color folder/file name to match its git status
	},
	-- settings for project.nvim
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
})

-- autocmd to close vim if nvim-tree is last buffer open
vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
			vim.cmd("quit")
		end
	end,
})
