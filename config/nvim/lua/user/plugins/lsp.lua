-- setup nvim-lsp-installer
require("nvim-lsp-installer").setup({
    ensure_installed = { "sumneko_lua" }, -- ensure these servers are always installed
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- Generic LSP setup
--------------------
-- Diagnostics
local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
    -- disable diagnostic text shown inline
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
    --   border = "rounded",
      source = "if_many", -- prefix diagnostic with source
      header = "",
      prefix = "",
    },
}

-- NOTE: If I decide to display current diagnostic in the message area 
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#print-diagnostics-to-message-area


vim.diagnostic.config(config)

-- Mappings.

-- See `:help vim.diagnostic.*` for documentation on any of the "vim.diagnostic" functions
-- See `:help vim.lsp.*` for documentation on any of the "vim.lsp" functions
local opts = { noremap=true, silent=true }
local keymap = vim.api.nvim_set_keymap -- local alias for set_keymap function
keymap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
keymap('n', 'ga', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

local wk = require("which-key")
wk.register({
	d = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Diagnostics" },
  l = {
	  name = "LSP",
	  f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
	  a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Actions" },
	  d = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Diagnostics" },
	  r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename Variable" },
  },
}, { prefix = "<leader>"})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Not set up
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- helper function for generating language specific LSP settings
local lsp_settings = function(server) 
    if server == "sumneko_lua" then
        return {
            Lua = {
              diagnostics = {
                globals = { 'vim', 'use' }
              },
              --workspace = {
                -- Make the server aware of Neovim runtime files
                --library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
              --}
            }
        }
    else 
        return {}
    end
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'sumneko_lua' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = lsp_settings(lsp),
  }
end
