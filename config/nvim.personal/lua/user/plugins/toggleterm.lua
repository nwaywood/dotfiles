local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

local wk = require("which-key")

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	direction = "float",
	close_on_exit = true,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ 
	cmd = "lazygit", 
	hidden = true,
	on_close = function(term)
		-- reload nvim-tree git status (colors etc) when lazygit window closes
        require'nvim-tree.actions.reloaders'.reload_git()
    end,
})

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

wk.register({
  g = {
	  name = "git",
	  g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
  },
}, { prefix = "<leader>"})