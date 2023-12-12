local wk = require("which-key")

vim.g.gitblame_enabled = 0 -- disable gitblame by default

wk.register({
  g = {
	  name = "git",
	  b = { ":GitBlameToggle<cr>", "blame" },
  },
}, { prefix = "<leader>"})