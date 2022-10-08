lvim.builtin.which_key.mappings["m"] = {
	name = "Metals",
	u = { "<Cmd>MetalsUpdate<CR>", "Update Metals" },
	i = { "<Cmd>MetalsInfo<CR>", "Metals Info" },
	r = { "<Cmd>MetalsRestartBuild<CR>", "Restart Build Server" },
	d = { "<Cmd>MetalsRunDoctor<CR>", "Metals Doctor" },
}

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

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.scala", "*.sbt", "*.sc" },
	callback = function()
		local metals_config = require("metals").bare_config()
		metals_config.on_attach = require("lvim.lsp").common_on_attach
		metals_config.init_options.statusBarProvider = "on"
		-- metals_config.settings = {
		-- 	showImplicitArguments = false,
		-- 	showInferredType = true,
		-- 	excludedPackages = {},
		-- }
		require("metals").initialize_or_attach(metals_config)
	end,
	group = nvim_metals_group,
})
