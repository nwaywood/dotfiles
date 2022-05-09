
require("trouble").setup {
-- your configuration comes here
-- or leave it empty to use the default settings
-- refer to the configuration section below
}


local wk = require("which-key")

-- keymaps
----------
wk.register({
  t = { 
    name = "Trouble",
    d = {"<cmd>TroubleToggle document_diagnostics<cr>", "Diagnostics"},
    w = {"<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics"},
    q = {"<cmd>TroubleToggle quickfix<cr>", "Quickfix List"},
    l = {"<cmd>TroubleToggle loclist<cr>", "Location List"},
    r = {"<cmd>TroubleToggle lsp_references<cr>", "LSP References"},
    t = {"<cmd>TroubleToggle lsp_type_definitions<cr>", "LSP Type Defs"},
    -- f = {"<cmd>Trouble lsp__definitions<cr>", "LSP Defs"},
  }
}, { prefix = "<leader>"})