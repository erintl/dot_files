return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
    },
    build = ":TSUpdate",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
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
          "markdown_inline",
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
        },
        sync_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<bs>",
          },
        },
      })

      -- Code Folding
      local opt = vim.opt
      opt.foldmethod = "expr"
      opt.foldexpr = "nvim_treesitter#foldexpr()"
      opt.foldenable = false
    end,
  },
}
