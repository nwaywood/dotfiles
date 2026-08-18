
require("trouble").setup {
-- your configuration comes here
-- or leave it empty to use the default settings
-- refer to the configuration section below
}


local wk = require("which-key")

-- keymaps
----------
wk.register({
  d = {"<cmd>TroubleToggle document_diagnostics<cr>", "Diagnostics"},
  t = { 
    name = "Trouble",
    d = {"<cmd>TroubleToggle document_diagnostics<cr>", "Diagnostics"},
    w = {"<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics"},
    q = {"<cmd>TroubleToggle quickfix<cr>", "Quickfix List"},
    l = {"<cmd>TroubleToggle loclist<cr>", "Location List"},
    r = {"<cmd>TroubleToggle lsp_references<cr>", "LSP References"},
    a = {"<cmd>TroubleToggle lsp_type_definitions<cr>", "LSP Type Defs"},
    t = {"<cmd>TroubleToggle<cr>", "Toggle"},
    -- f = {"<cmd>Trouble lsp__definitions<cr>", "LSP Defs"},
  }
}, { prefix = "<leader>"})
-- jump to the next item, skipping the groups
require("trouble").next({skip_groups = true, jump = true});

-- jump to the previous item, skipping the groups
require("trouble").previous({skip_groups = true, jump = true});

wk.register({
  ["]]"] = {"<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>", "Trouble Next"},
  ["[["] = {"<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>", "Trouble Prev"},
})