local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
	return
end
project.setup({})

-- telescope integration
require"telescope".load_extension('projects')

-- nvim integration
vim.g.nvim_tree_respect_buf_cwd = 1

local wk = require("which-key")

wk.register({
  p = { ":Telescope projects<cr>", "Projects" },
}, { prefix = "<leader>"})
