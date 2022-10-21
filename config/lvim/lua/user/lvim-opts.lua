-- general lvim settings
lvim.log.level = "warn"
lvim.format_on_save = {
	pattern = { "*.lua", "*.scala" },
}
lvim.colorscheme = "tokyonight"
lvim.leader = "space"
-- lvim.builtin.bufferline.active = false
lvim.builtin.bufferline.options.always_show_bufferline = false
lvim.builtin.terminal.active = true
lvim.builtin.breadcrumbs.active = true

-- dashboard
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
local dashboard = require("alpha.themes.dashboard")
-- local dashboardTable = lvim.builtin.alpha.dashboard.section.buttons.val
-- table.insert(dashboardTable, 3, dashboard.button("e", lvim.icons.ui.Note .. "  Open Explorer", ":NvimTreeToggle<CR>"))
lvim.builtin.alpha.dashboard.section.buttons.val = {
	dashboard.button("f", lvim.icons.ui.FindFile .. "  Find File", "<CMD>Telescope find_files<CR>"),
	dashboard.button("n", lvim.icons.ui.NewFile .. "  New File", "<CMD>ene!<CR>"),
	dashboard.button("e", lvim.icons.ui.Note .. "  Open Explorer", ":NvimTreeToggle<CR>"),
	dashboard.button("p", lvim.icons.ui.Project .. "  Projects ", "<CMD>Telescope projects<CR>"),
	dashboard.button("r", lvim.icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>"),
	dashboard.button(
		"a",
		lvim.icons.ui.FindText .. "  Find Text",
		"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>"
	),
	dashboard.button(
		"c",
		lvim.icons.ui.Gear .. "  Configuration",
		"<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>"
	),
}

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
