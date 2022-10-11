-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local ok, actions = pcall(require, "telescope.actions")
if not ok then
	return
end
lvim.builtin.telescope.defaults.mappings = {
	-- for input mode
	i = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
		["<C-n>"] = actions.cycle_history_next,
		["<C-p>"] = actions.cycle_history_prev,
		["<C-g>"] = actions.close,
		["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
		["<esc>"] = actions.close,
	},
	-- for normal mode
	n = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
		["<C-g>"] = actions.close,
		["<esc>"] = actions.close,
		["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
		["dd"] = actions.delete_buffer,
	},
}
lvim.builtin.telescope.extensions.live_grep_args = {
	auto_quoting = false,
	mappings = {
		i = {
			-- need to override the default keymap for adding quotes
			["<C-k>"] = actions.move_selection_previous,
		},
	},
}
lvim.builtin.telescope.defaults.prompt_prefix = "❯ "

lvim.builtin.which_key.mappings.b = { "<cmd>Telescope buffers<cr>", "Buffers" }
lvim.builtin.which_key.mappings.a = {
	"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
	"Grep Project",
}
