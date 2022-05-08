local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local wk = require("which-key")

-- keymaps
----------
wk.register({
  f = { "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", "Find File" },
  a = { "<cmd>Telescope live_grep<cr>", "Grep Project" },
  c = { "<cmd>Telescope commands<cr>", "Commands" },
  s = { "<cmd>lua require'telescope.builtin'.lsp_document_symbols(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", "File Symbols"},
  -- lsp
  l = { 
    w = {"<cmd>lua require'telescope.builtin'.lsp_dynamic_workspace_symbols()<cr>", "Workspace Symbols"},
  },
  -- help
  h = { 
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
      },

      n = {
        ["<C-g>"] = actions.close, -- default is C-c
        ["<C-s>"] = actions.select_horizontal, -- default is C-x

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<C-b>"] = actions.results_scrolling_up,
        ["<C-f>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- live_grep = {
    --   prompt_position = "top",
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
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
