require("gitlinker").setup({
	opts = {
		-- don't add current line nr in the url for normal mode
		add_current_line_on_normal_mode = false,
		-- callback for what to do with the url
		-- action_callback = require"gitlinker.actions".open_in_browser,
		action_callback = require("gitlinker.actions").copy_to_clipboard,
		-- print the url after performing the action
		print_url = false,
	},
	-- default mapping to call url generation with action_callback
	mappings = "<leader>gy",
})

-- I needed to manually set these bindings because for some reason the default config wasn't working in lvim
lvim.builtin.which_key.mappings.g.y = {
	'<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".copy_to_clipboard})<cr>',
	"Gitlinker",
}
lvim.builtin.which_key.vmappings["gy"] = {
	'<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".copy_to_clipboard})<cr>',
	"Gitlinker",
}
