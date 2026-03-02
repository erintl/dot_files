return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
    },
    build = ":TSUpdate",
    lazy = false,
    config = function()
      treesitter = require("nvim-treesitter")
      treesitter.setup({})
      treesitter.install({
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "bash",
        "cmake",
        "cpp",
        "css",
        "dockerfile",
        "embedded_template",
        "git_config",
        "gitcommit",
        "gitignore",
        "gpg",
        "graphql",
        "groovy",
        "html",
        "java",
        "javascript",
        "jq",
        "json",
        "kotlin",
        -- "latex",
        "markdown",
        -- "markdown_inline",
        "python",
        "regex",
        "ruby",
        "scss",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "xml",
        "yaml",
      })

      -- Code Folding
      local opt = vim.opt
      opt.foldmethod = "expr"
      opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.opt.foldlevel = 99
      -- opt.foldenable = false
    end,
  },
}
