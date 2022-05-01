local keymap = vim.api.nvim_set_keymap -- local alias for set_keymap function
local opts = { noremap = true, silent = true }

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>n", ":NvimTreeFindFile<cr>", opts)

nvim_tree_config = require "nvim-tree.config"
local tree_cb = nvim_tree_config.nvim_tree_callback

require'nvim-tree'.setup {
    disable_netrw = true, -- nvim-tree to override netrw
    view = {
        width = 40,
        mappings = {
          custom_only = false,
          list = {
            { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
            { key = "h", cb = tree_cb "close_node" },
            { key = "v", cb = tree_cb "vsplit" },
            { key = "s", cb = tree_cb "split" },
          },
        },
    },
    git = {
        ignore = false, -- display gitignored files
    },
}

vim.g.nvim_tree_group_empty = 1 -- group empty dirs on one line like vscode
vim.g.nvim_tree_git_hl = 1 -- color folder/file name to match its git status
-- close vim if nvim-tree is last buffer open
vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")