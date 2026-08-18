
return {
    "numToStr/Navigator.nvim",
    config = function(plugin)
        require('Navigator').setup()
    end,
    keys = {
        {"<C-h>", "<cmd>NavigatorLeft<cr>"},
        {"<C-j>", "<cmd>NavigatorDown<cr>"},
        {"<C-k>", "<cmd>NavigatorUp<cr>"},
        {"<C-l>", "<cmd>NavigatorRight<cr>"},
    }
}