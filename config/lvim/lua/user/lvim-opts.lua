-- general lvim settings
lvim.log.level = "warn"
lvim.format_on_save = {
	pattern = { "*.lua", "*.scala" },
}
lvim.colorscheme = "tokyonight"
lvim.leader = "space"
-- lvim.builtin.bufferline.active = false
lvim.builtin.bufferline.options.always_show_bufferline = false
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.breadcrumbs.active = true

-- dashboard
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
local dashboard = require("alpha.themes.dashboard")
local dashboardTable = lvim.builtin.alpha.dashboard.section.buttons.val
table.insert(dashboardTable, 3, dashboard.button("e", lvim.icons.ui.Note .. "  Open Explorer", ":NvimTreeToggle<CR>"))

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
