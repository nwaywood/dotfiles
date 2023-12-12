local configs = require 'nvim-treesitter.configs'

configs.setup {
      ensure_installed = {
        "lua",
        "scala",
        "bash",
        "dockerfile",
        "html",
        "css",
        "java",
        "javascript",
        "json",
        "regex",
        "ruby",
        "toml",
        "yaml",
        "typescript",
      },
      highlight = {
          enable = true,
      },
      indent = {
          enable = true,
      }
}

-- use treesitter for folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

