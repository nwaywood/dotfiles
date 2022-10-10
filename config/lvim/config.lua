require("user.plugins")
require("user.lvim-opts")
require("user.lsp")
require("user.vimopts") -- general vim settings
require("user.keymaps") -- general vim keymaps
require("user.autocmds")

-- plugin config
require("user.plugins.telescope")
require("user.plugins.metals")
-- cybu
-- jabs
-- gitlinker
-- sessions plugin
-- harpoon?
-- navigator
-- trouble
-- telescope-live-grep-args
-- nvim tree `go` binding

-- neovide gui
if vim.g.neovide then
	-- disable the stupid cursor animation
	vim.g.neovide_cursor_animation_length = 0
end
