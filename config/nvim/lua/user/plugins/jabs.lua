local jabs = require("jabs")

jabs.setup {
  position = "center", -- center, corner
  width = 50,
  height = 10,
  border = "rounded", -- none, single, double, rounded, solid, shadow, (or an array or chars)

  -- Options for preview window
  preview_position = "top", -- top, bottom, left, right
  preview = {
    width = 70,
    height = 20,
    border = "rounded", -- none, single, double, rounded, solid, shadow, (or an array or chars)
  },
}

local wk = require("which-key")

-- keymaps
----------
wk.register({
  b = { "<cmd>JABSOpen<cr>", "Buffers" },
}, { prefix = "<leader>"})