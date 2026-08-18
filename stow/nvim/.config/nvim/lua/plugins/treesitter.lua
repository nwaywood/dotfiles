  -- add more treesitter parsers
return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
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
        "tsx",
        "typescript",
        "markdown",
        "markdown_inline",
        "vim",
      },
    },
  }