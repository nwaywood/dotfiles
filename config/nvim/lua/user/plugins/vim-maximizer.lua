local wk = require("which-key")

vim.g.maximizer_set_default_mapping = 0 -- disable default mapping

wk.register({
  z = { "<cmd>MaximizerToggle!<cr>", "Toggle Maximise" },
}, { prefix = "<C-w>"})