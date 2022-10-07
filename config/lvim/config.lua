require("user.plugins")
require("user.lvim-core") -- colorscheme
require("user.vimopts") -- general vim settings
require("user.keymaps") -- general vim keymaps
require("user.autocmds")

-- plugin config
require("user.plugins.telescope")

vim.api.nvim_set_keymap("n", "<S-k>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-j>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

lvim.builtin.which_key.mappings["m"] = {
	name = "Metals",
	u = { "<Cmd>MetalsUpdate<CR>", "Update Metals" },
	i = { "<Cmd>MetalsInfo<CR>", "Metals Info" },
	r = { "<Cmd>MetalsRestartBuild<CR>", "Restart Build Server" },
	d = { "<Cmd>MetalsRunDoctor<CR>", "Metals Doctor" },
}
lvim.builtin.which_key.mappings.a = { "<cmd>Telescope live_grep<cr>", "Grep Project" }
lvim.builtin.which_key.mappings.n = { "<cmd>NvimTreeFindFile<cr>", "Show In Explorer" }
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

local components = require("lvim.core.lualine.components")
local function metals_status()
	local status = vim.g["metals_status"]
	if status == nil then
		return ""
	else
		return status
	end
end
lvim.builtin.lualine.sections.lualine_c = {
	components.diff,
	components.python_env,
	metals_status,
}
