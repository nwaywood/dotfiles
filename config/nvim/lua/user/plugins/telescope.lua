local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local trouble = require("trouble.providers.telescope")
local wk = require("which-key")

-- keymaps
----------
wk.register({
  f = { "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", "Find File" },
  -- a = { "<cmd>Telescope live_grep<cr>", "Grep Project" },
  a = { "<cmd>lua require('telescope').extensions.live_grep_raw.live_grep_raw()<cr>", "Grep Project" },
  c = { "<cmd>Telescope commands<cr>", "Commands" },
  s = { "<cmd>lua require'telescope.builtin'.lsp_document_symbols(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", "File Symbols"},
  -- lsp
  l = { 
    w = {"<cmd>lua require'telescope.builtin'.lsp_dynamic_workspace_symbols()<cr>", "Workspace Symbols"},
  },
  -- help
  h = { 
    name = "Help",
    v = {"<cmd>lua require'telescope.builtin'.help_tags()<cr>", "Vim Docs"},
    h = {"<cmd>lua require'telescope.builtin'.highlights()<cr>", "Highlights"},
    k = {"<cmd>lua require'telescope.builtin'.keymaps()<cr>", "Keymaps"},
  }
}, { prefix = "<leader>"})

-- To make grep_string take an input instead of using the word under the cursor
-- require ('telescope.builtin.files').grep_string({search = vim.fn.input("Search term: ")})

-- settings
-----------
telescope.setup {
  defaults = {
    -- this is required for prompt_position: top to make sense
    sorting_strategy = "ascending",
    layout_config = {
        -- "horizontal" is the default layout
        horizontal = {
            -- put the prompt at the top instead of the bottom
            prompt_position = "top"
        },
        center =  {
          -- anchor the dropdown layout to the top of the screen instead of the center
          anchor = "N"
        }
    },
    prompt_prefix = "❯ ",
    -- prompt_position = "top",
    -- selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-g>"] = actions.close, -- default is C-c
        ["<C-s>"] = actions.select_horizontal, -- default is C-x

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<C-b>"] = actions.results_scrolling_up,
        ["<C-f>"] = actions.results_scrolling_down,
        
        ["<c-t>"] = trouble.open_with_trouble,
      },

      n = {
        ["<C-g>"] = actions.close, -- default is C-c
        ["<C-s>"] = actions.select_horizontal, -- default is C-x

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<C-b>"] = actions.results_scrolling_up,
        ["<C-f>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
        
        ["<c-t>"] = trouble.open_with_trouble,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
}

telescope.load_extension("fzf")
telescope.load_extension('live_grep_raw')

-- https://github.com/nvim-telescope/telescope.nvim/blob/master/plugin/telescope.lua
vim.api.nvim_set_hl(0, "TelescopeTitle", { link = "Keyword" }) -- keyword = Purple
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "Keyword" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "Keyword" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "Keyword" })
