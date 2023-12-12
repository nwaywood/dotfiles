local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

-- don't show statusline section is not wide enough
local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

-- git diff info
local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width
}

-- change branch icon
local branch = {
	"branch",
	icon = "",
}

local function metals_status()
  local status = vim.g['metals_status']
  if status == nil then
    return ""
  else 
    return status
  end
end

lualine.setup {
  options = {
    icons_enabled = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = { branch, diff },
    lualine_c = {'diagnostics', 'filename', metals_status},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- local diagnostics = {
-- 	"diagnostics",
-- 	sources = { "nvim_diagnostic" },
-- 	sections = { "error", "warn" },
-- 	symbols = { error = " ", warn = " " },
-- 	colored = false,
-- 	update_in_insert = false,
-- 	always_visible = true,
-- }
