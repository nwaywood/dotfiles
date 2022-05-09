
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
    d = {"<cmd>Trouble document_diagnostics<cr>", "Diagnostics"},
    w = {"<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics"},
    q = {"<cmd>Trouble quickfix<cr>", "Quickfix List"},
    l = {"<cmd>Trouble loclist<cr>", "Location List"},
    r = {"<cmd>Trouble lsp_references<cr>", "LSP References"},
    t = {"<cmd>Trouble lsp_type_definitions<cr>", "LSP Type Defs"},
    -- f = {"<cmd>Trouble lsp__definitions<cr>", "LSP Defs"},
  }
}, { prefix = "<leader>"})