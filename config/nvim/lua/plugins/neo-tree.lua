local Util = require("lazyvim.util")
return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
        {"<leader>fe", false},
        {"<leader>fE", false},
        { "<leader>e", function()
          require("neo-tree.command").execute({ toggle = true, dir = Util.root() })
        end,
         desc = "Explorer NeoTree (root dir)", remap = true },
        { "<leader>E", function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)", remap = true },
    },
    opts = {
        window = {
            mappings = {
                ["l"] = "open",
                ["o"] = "open",
                ["h"] = "close_node",
                ["s"] = "open_split",
                ["v"] = "open_vsplit",
                ["go"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
            }
        }
    }
}