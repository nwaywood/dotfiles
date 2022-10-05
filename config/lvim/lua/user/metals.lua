local M = {}

-- TODO: Figure out why this is running! Caching? Old autocmd? dodgy code? lua auto loading file?
M.config = function()
	vim.notify("hel22lo")
	local metals_config = require("metals").bare_config()
	metals_config.on_attach = require("lvim.lsp").common_on_attach
	metals_config.init_options.statusBarProvider = "on"
	-- metals_config.settings = {
	-- 	showImplicitArguments = false,
	-- 	showInferredType = true,
	-- 	excludedPackages = {},
	-- }
	require("metals").initialize_or_attach(metals_config)
end

return M
