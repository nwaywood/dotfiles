require("user.plugins")
require("user.lvim-opts")
require("user.lsp")
require("user.vimopts") -- general vim settings
require("user.keymaps") -- general vim keymaps
require("user.autocmds")

-- plugin config
require("user.plugins.telescope")
require("user.plugins.gitlinker")
require("user.plugins.navigator")
require("user.plugins.metals")
-- cybu
-- jabs
-- sessions plugin
-- harpoon?
-- trouble
-- nvim tree `go` binding
-- better git colors in nvim-tree

-- neovide gui
if vim.g.neovide then
	-- disable the stupid cursor animation
	vim.g.neovide_cursor_animation_length = 0
end
