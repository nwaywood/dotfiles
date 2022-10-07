-- general lvim settings
lvim.log.level = "warn"
lvim.format_on_save = {
	pattern = { "*.lua", "*.scala" },
}
lvim.colorscheme = "tokyonight"
lvim.leader = "space"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.bufferline.options.always_show_bufferline = false
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.renderer.highlight_git = true
lvim.builtin.nvimtree.setup.renderer.group_empty = true
lvim.builtin.nvimtree.setup.view.width = 40
lvim.builtin.breadcrumbs.active = true

vim.api.nvim_set_keymap("n", "gh", ":lua vim.lsp.buf.hover()<CR>", { silent = true, noremap = true })

-- change lsp hover mapping
lvim.lsp.buffer_mappings.normal_mode["K"] = nil
lvim.lsp.buffer_mappings.normal_mode["gh"] = { vim.lsp.buf.hover, "Show hover" }

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

-- generic LSP settings

-- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
	"sumeko_lua",
	"jsonls",
	"yamlls",
}

-- ---@usage disable automatic installation of servers
lvim.lsp.installer.setup.automatic_installation = false

lvim.lsp.diagnostics.virtual_text = true
-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	-- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
	{ exe = "stylua", filetypes = { "lua" } },
})
