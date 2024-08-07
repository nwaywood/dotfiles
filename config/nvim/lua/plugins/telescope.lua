local Util = require("lazyvim.util")
local actions = require("telescope.actions")
local open_with_trouble = require("trouble.sources.telescope").open

return {
    {
  "nvim-telescope/telescope.nvim",
  keys = {
    {"<leader>fb", false},
    {"<leader>fc", false},
    {"<leader>fF", false},
    {"<leader>ff", false},
    {"<leader>fr", false},
    {"<leader>fR", false},
    -- replace <leader>/ with <leader>a
    {"<leader>/", false},
    { "<leader>a", Util.pick("live_grep"), desc = "Grep project" },
    -- replace <leader><space> with <leader>f
    {"<leader><space>", false},
    -- { "<leader>f", Util.telescope("files", {previewer = false}), desc = "Find Files" },
    -- { "<leader>F", Util.telescope("files", {previewer = false, cwd = false}), desc = "Find Files 2" },
    {
      "<leader>f",
      "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
      desc = "Find files",
    },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { 
        -- put the prompt at the top instead of the bottom
        prompt_position = "top", 
        center =  {
          -- anchor the dropdown layout to the top of the screen instead of the center
          anchor = "N"
        }
    },
    -- this is required for prompt_position: top to make sense
      sorting_strategy = "ascending",
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

          ["<c-t>"] = open_with_trouble,
        },

        n = {
          ["<C-g>"] = actions.close, -- default is C-c
          ["<C-s>"] = actions.select_horizontal, -- default is C-x

          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,

          ["<C-b>"] = actions.results_scrolling_up,
          ["<C-f>"] = actions.results_scrolling_down,

          ["?"] = actions.which_key,

          ["<c-t>"] = open_with_trouble,
        },
      },
    },
  },
},
  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

}

