local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end


bufferline.setup {
  options = {
    numbers = "ordinal",
    -- offset bufferline when nvim-tree is opened
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    -- chris had this changed from the default
    -- enforce_regular_tabs = true,
  },
  highlights = {
        fill = {
            bg = { attribute = "bg", highlight = "FloatBorder" }, -- the "empty" part of the bufferline
        },
  }
}

-- keymaps
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap -- local alias for set_keymap function
-- alt j/k to reorder buffer tabs
keymap("n", "<A-j>", "<cmd>BufferLineMovePrev<CR>", opts)
keymap("n", "<A-k>", "<cmd>BufferLineMoveNext<CR>", opts)
-- jump to buffer
keymap("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)


-- hide all <leader>num mappings from which-key
local wk = require("which-key")
wk.register({
  ["1"] = "which_key_ignore",
  ["2"] = "which_key_ignore",
  ["3"] = "which_key_ignore",
  ["4"] = "which_key_ignore",
  ["5"] = "which_key_ignore",
  ["6"] = "which_key_ignore",
  ["7"] = "which_key_ignore",
  ["8"] = "which_key_ignore",
  ["9"] = "which_key_ignore",
  c = {"<cmd>bdelete!<cr>", "Close Buffer"},
}, { prefix = "<leader>" })
