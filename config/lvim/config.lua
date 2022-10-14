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
require("user.plugins.nvim-ufo")

-- cybu
-- jabs
-- sessions plugin
-- harpoon? (leader m to mark file, tab to view)
-- trouble
-- git-blame file
-- smooth scroll
-- scrollbar
-- leader s for symbols
-- leader h bindings for help (from leader s)

-- neovide gui
if vim.g.neovide then
	-- disable the stupid cursor animation
	vim.g.neovide_cursor_animation_length = 0
end
