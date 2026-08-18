return { 
    "ruifm/gitlinker.nvim", 
    dependencies = "nvim-lua/plenary.nvim",
    config = function(plugin)
        require('gitlinker').setup({ opts = {
                 -- don't add current line nr in the url for normal mode
                add_current_line_on_normal_mode = false,
                -- callback for what to do with the url
                -- action_callback = require"gitlinker.actions".open_in_browser,
                -- action_callback = require"gitlinker.actions".copy_to_clipboard,
                -- print the url after performing the action
                print_url = false,
            }
        })
    end,
    keys = {
        { "<leader>gy", "<cmd>Gitlinker<cr>", desc = "Gitlinker" },
    },
}